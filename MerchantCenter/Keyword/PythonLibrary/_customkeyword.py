from selenium import webdriver
import os
import base64
import mimetypes
import sys
import imghdr
import httplib
import cStringIO
import hashlib

# import pymongo
# from pymongo import MongoClient
# from bson.json_util import dumps
# import json

class _CustomKeyword(object):
	"""docstring for ClassName"""
	#def __init__(self, arg):
	#	super(ClassName, self).__init__()
	#	self.arg = arg

def get_chrome_mobile_options(user_agent_string):
		chrome_options = webdriver.ChromeOptions()
		chrome_options.add_argument("--user-agent={0}".format(user_agent_string))
		return chrome_options

def get_chrome_allow_notification():
	chrome_options = webdriver.ChromeOptions()
	prefs = {'profile.managed_default_content_settings.notifications' : 1}
	chrome_options.add_experimental_option("prefs",prefs)
	return chrome_options

def get_discount_price(condition,itemamount,discount,current):

	match_discount = current

	print "condition:",condition,", itemamount:",itemamount,", discount:",discount,", currentdiscount:",current

	# if current == 0:
	# 	match_discount = match_discount

	# else:
	# 	match_discount = current

	if float(itemamount) >= float(condition):
		match_discount = discount
		print "item amount match with this condition"
	else:
		print "item amount not match with this condition"

	return match_discount

def get_discount_from_percent(condition,itemamount,summary,discount,max_discount,current):

	match_discount = current

	print "condition: ",condition
	print "itemamount: ",itemamount
	print "summary: ",summary
	print "discount: ",discount
	print "max discount: ",max_discount
	print "currentdiscount: ",current

	# if current == 0:
	# 	match_discount = match_discount

	# else:
	# 	match_discount = current

	if float(itemamount) >= float(condition):
		match_discount = (summary * discount) / 100
		print "item amount match with this condition"
		print "Current discount :", match_discount

	else:
		print "item amount not match with this condition"
		print "Current discount :", match_discount

	if float(match_discount) > float(max_discount):
		print "Discount is Over max rate, discount should be reset to :", max_discount
		match_discount = max_discount
		print "Current :", match_discount

	return match_discount

def calculate_checkout_net_total(beforenet,promotion_discount):

	if promotion_discount == '':
		promotion_discount = 'None'

	print "Before Net : ", beforenet, ", Promotion Discount : ", promotion_discount

	net_amount = 0

	if promotion_discount == 'None':
		net_amount = float(beforenet) - 0
	else:
		net_amount = float(beforenet) - float(promotion_discount)

	return net_amount

def calculate_checkout_net_total_include_shipping(before_net,shipping_cost,discount):

	print "Before Net: ", before_net," Shipping Cost: ",shipping_cost," Discount: ", discount

	before_net = float(before_net)
	shipping_cost = float(shipping_cost)

	if discount != '':
		discount = float(discount)

	net_amount = 0

	if discount == '':
		print "This order don't have any discount !!"
		net_amount = before_net + shipping_cost
	else:
		print "This order have discount : ", discount, " Baht"
		net_amount = before_net + shipping_cost - discount

	return net_amount

def get_match_discount_condition(condition,itemamount,discount,condition_text,match_condition):

	current_condition = "None"

	if itemamount >= condition:
		current_condition = condition_text

	else:
		current_condition = match_condition

#	text_condition = current_condition.encode('utf-8')

	print "Condition : ",current_condition

	return current_condition

# def test_safari(url,path):
# 	os.environ["SELENIUM_SERVER_JAR"] = path
# # note: I've put this jar file in the same folder as this python file

# 	browser = webdriver.Safari()

# # makes the browser wait if it can't find an element
# 	browser.implicitly_wait(10)

# 	browser.get(url)

def create_profile(path):
    fp = webdriver.FirefoxProfile()
    fp.set_preference("webdriver.load.strategy", "unstable")
    fp.set_preference("browser.download.folderList",2)
    fp.set_preference("browser.download.manager.showWhenStarting",False)
    fp.set_preference("browser.download.dir",path)
    fp.set_preference("browser.helperApps.neverAsk.saveToDisk",'application/csv')
    fp.update_preferences()
    return fp.path


def img_to_data(path):
    """Convert a file (specified by a path) into a data URI."""
    if not os.path.exists(path):
        raise FileNotFoundError
    mime, _ = mimetypes.guess_type(path)
    with open(path, 'rb') as fp:
        data = fp.read()
        data64 = u''.join(base64.encodestring(data).splitlines())
        return u'data:%s;base64,%s' % (mime, data64)

def fill_digit_of_the_month(mm):
	prefix = str(0)

	if mm < 10:
		mm = (str(mm))
		mm = prefix + mm
	else:
		mm = str(mm)

	return mm

def fill_digit_of_the_day(dd):
	prefix = str(0)

	if dd < 10:
		dd = (str(dd))
		dd = prefix + dd
	else:
		dd = str(dd)

	return dd

def verify_resize(url,path):
	conn = httplib.HTTPSConnection(url, timeout=60)
	conn.request('GET', path)
	r1 = conn.getresponse()

	image_file_obj = cStringIO.StringIO(r1.read())
	img_extension = imghdr.what(image_file_obj)

	return img_extension
# def update_campaign_status_in_mongo(id,status):
# 	client = MongoClient('mongodb://powls:pow154!@mongodb-02.wls-dev.com:27017/weloveshopping?authMechanism=SCRAM-SHA-1')
# 	db = client.weloveshopping
# 	collection = db.campaign

# 	cursor = collection.update_one(
# 		{"id": int(id)},
# 			{
# 				"$set": {
# 				"status": int(status)
# 			}
# 		}
# 	)

# 	cursor = collection.find_one({"id": int(id)})

# 	data = dumps(cursor)

# 	campaign_detail = json.loads(data)

# 	print "Campaign Status : ",(campaign_detail['status'])

# 	return (campaign_detail['status'])

def gen_token_from_md5(secure_key, app_secret, action) :
	m = hashlib.md5()
	m.update(secure_key+app_secret+action)
	return m.hexdigest()

def get_canonical_path(path):
    return os.path.abspath(path)
