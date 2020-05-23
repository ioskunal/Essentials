//
//  AlertMessage.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 04/11/19.
//  Copyright © 2019 Kunal Gupta All rights reserved.
//

import Foundation

//MARK: - ALERTMESSSAGE

struct AlertMesssage {
    
    static let LIMIT_EXCEEDED = "Attempt limit exceeded"
    static let MINIMUM_MONEY_ERROR = "Your transfer amount must be greater than $0.01." //
    static let MINIMUM_FUND_ACCOUNT_ERROR = "Try moving at least $50.00 for the first time."
    static let MAXIMUM_MONEY_ERROR = " You can only transfer up to $10,000,000.00 at a time. Get in touch with customer service if you need to spend more!"
    static let LOGOUT_TITLE = "Logged Out"
    static let LOGOUT_SUBTITLE = "You have been logged out. Please log in again."
    static let FUND_YOUR_ACCOUNT = "To enjoy free electronic payments for life, fund your account with $50 and you’re ready to roll!"
    static let VERIFY_YOUR_ACCOUNT_TITLE = "Update Account Info"
    static let VERIFY_YOUR_ACCOUNT_SUBTITLE = "Update your account details in order to transfer funds to Novo"
    static let FUND_IN_PROGRESS = "You don’t have enough funds to complete this transaction. If you have added funds to Novo they will arrive in 2-3 business days."
    static let FORGOT_PASSWORD_WARNING = "Are you sure you don't want to reset your password?"
    static let MINIMUM_CHECK_AMOUNT = "Checks must be for an amount greater than $0."
    static let CHECK_INTERNET_CONNECTION = "You are not connected to the internet."
    static let MONEY_INCOMING_MESSAGE = "All payments sent after 2:30 PM EST will be processed on the next business day."
    static let ROOTED_DEVICE_TITLE = "System Requirements"
    static let ROOTED_DEVICE_SUBTITLE = "This app is only supported on unmodified versions of iOS."
    static let ACTION_TERMINATED = "User is trying to login with rooted device. Action Terminated"
    static let FAILED_TO_VERIFY = "We are not able to recognize you. Please try again."
    static let PROCESS_INTERUPPTED = "Something interrupted the scanning process"
    static let USE_PASSWORD = "Want to use your password?"
    static let REQUEST_CANCELLED = "You cancelled the request."
    static let PAPER_CHECK_SUCCESS = "Cha-ching! Funds will appear in your account in 2-3 days."
    static let ACH_SUCCESS = "Cha-ching! Your funds should arrive in 2-3 business days."
    static let PULL_FUNDS_SUCCESS = "Cha-ching! Your funds should arrive soon, depending on the balance available in your external account."
    static let DEPOSIT_CHECK_SUCCESS = "Cha-ching! Your check has been deposited successfully."
    static let CONNECT_TO_XERO = "Add Novo to Xero for seamless accounting. All your Novo activity is automatically imported into Xero every hour.\n\nWith Novo + Xero say goodbye to transaction reconciliation."
    static let CONNECTED_TO_XERO = "Novo sends transactions to Xero every hour"
    static let SOMETHING_WENT_WRONG = "Something went wrong"
    static let QUIT = "Quit"
    static let XERO_SPECIFIC_DATE = "Please select a specific date."
        
    //MARK: - ADD PAYEE
    
    static let ENTER_PAYEE_NAME = "Please enter the payee's name."
    static let ENTER_VALID_PAYEE_NAME = "Please enter a valid payee name."
    static let PAYEE_TYPE = "Please select payee type."
    static let PAYEE_NAME_INVALID_CHARACTERS = "Your payee name cannot contain numbers or special characters."
    static let ENTER_VALID_ACCOUNT_NUMBER = "Please enter a valid account number."
    static let ENTER_VALID_ROUTING_NUMBER = "Please enter a valid routing number."
    static let ENTER_VALID_ADDRESS = "Please enter a valid address."
    static let ADDRESS_INVALID_CHARACTER = "The address field contains invalid characters."
    static let UNIT_INVALID_CHARACTER = "The unit/suite field contains invalid characters."
    static let ENTER_VALID_CITY = "Please enter a valid city name."
    static let CITY_INVALID_CHARACTER = "The city field contains invalid characters."
    static let SELECT_STATE = "Please select a state."
    static let ENTER_ZIP = "Please enter the ZIP code."
    static let ENTER_VALID_ZIP = "Please enter a valid ZIP code."
    static let QUIT_ADD_PAYEE_TITLE = "Exit adding a payee?"
    static let QUIT_ADD_PAYEE_SUBTITLE = "If you exit now, all of your progress will be lost."
    static let INVALID_ADDRESS = "Please enter a valid address."
    
    //MARK: - PAYEE INFORMATION
    
    static let DELETE_PAYEE_TITLE = "Delete Payee"
    static let DELETE_SUBTITLE = "Are you sure you want to delete "
    static let PAYEE_DELETED = "Payee deleted successfully. "
    static let PAYEE_DETAILS_UPDATED = "Success! Your payee details have been updated."
    static let PAYEE_NOT_FOUND = "Looks like you don't have any payees matching your search. You can always add a new one."
    
    //MARK: - FORGOT PASSWORD and LOGIN
    
    static let ENTER_EMAIL = "Please enter your email. "
    static let ENTER_VALID_EMAIL = "That email is invalid. Please try again."
    static let ENTER_VALID_PASSWORD = "Please enter a valid password."
    
    //MARK: - TRANSFER
    
    static let ADD_MEMO = "Please add a memo to proceed."
    static let SELECT_PAYEE = "Please select a payee."
    static let ADD_PAYEE_MESSAGE = "Add payees to send payments."
    static let MONEY_SENT = "You have sent a payment to: "
    
    //MARK: - DASHBOARD
    
    static let FUNDS_ON_THE_WAY = "Funds on the way"
    static let FUNDS_ON_THE_WAY_SUBTITLE = "Nice! Your [Amount] will be here once your other bank gets started."
    static let FUNDS_ON_THE_WAY_MESSAGE = "P.S. These 💵 are all yours to enjoy"
    static let FUND_ACCOUNT = "FUND ACCOUNT"
    static let FUND_ACCOUNT_SUBTITLE = "with your other bank accounts"
    static let FUND_ACCOUNT_MESSAGE = "Link Accounts "
    static let REFERRAL_TEXT = "Hey, I’m using Novo for my business banking. I think you might be interested:\n\nhttps://banknovo.com?utm_source=novo-user&utm_medium=share&utm_campaign=ios-app-referral-dashboard&utm_content="
    
    //MARK: - ACTIVITIES
    
    static let PULL_TO_REEFRESH = "Pull to refresh. "
    static let RELEASE_TO_REFRESH = "Release to refresh activities."
    static let REFRESHING = "Refreshing..."
    static let NO_RESULTS = "We cannot find any results."
    static let NO_TRANSACTIONS = "There are no transactions yet."
    static let NO_TRANSACTIONS_TO_EXPORT = "There are no transactions to export."
    static let NO_SYNCED_TRANSACTIONS = "There is no history yet."
    static let NOTES_UPDATED = "Success! Your note has been updated."
    
    //MARK: - ACTIVITIES FILTER
    
    static let SELECT_START_DATE = "Please select a start date."
    static let END_DATE_PICKED_BEFORE = "You cannot pick an end date before the start date."
    
    //MARK: - ACTIVITY HISTORY
    
    static let ACH_HISTORY_TITLE = "Cha-ching! Electronic transfers will appear in your account in 2-3 days."
    static let MAILED_CHECK_HISTORY_TITLE = "Paper check payments will appear in your account once the checks are cashed."
    
    //MARK: - REQUEST EDIT
    
    static let ADD_DESCRIPTION = "Please add a description."
    static let ADD_VALID_PHONE_NUMBER = "Please add a valid phone number."

    //MARK: - PASSWORD
    
    static let ENTER_OLD_PASSWORD = "Your password must be at least 8 characters."
    static let ENTER_NEW_PASSWORD = "Please enter a new password that is at least 8 characters."
    static let ENTER_CONFIRM_PASSWORD = "Please confirm your new password."
    static let NEW_PASSWORD_ONE_LETTER = "Your new password must contain at least one letter."
    static let NEW_PASSWORD_ONE_NUMBER = "Your new password must contain at least one number."
    static let NEW_PASSWORD_ONE_SPECIAL_CHARACTER = "Your new password must contain at least one special character."
    static let OLD_NEW_CANT_BE_SAME = "Your new password cannot be the same as your old password."
    static let NEW_PASSWORD_LENGTH = "Your new password must be at least 8 characters long."
    static let PASSWORD_DONT_MATCH = "Your passwords do not match."
    static let PASSWORD_REGEX_DONT_MATCH = "Your new password must contain at least one letter, one number, and one special character. It must be between 8 and 30 characters."
    
    //MARK: - TRAVEL NOTICE
    
    static let ADD_TRAVEL_NOTICE_TITLE = "Bon Voyage!"
    static let ADD_TRAVEL_NOTICE_SUBTITLE = "Going on a trip? Submit a travel notice so we can protect your account while you're gone."
    static let REMOVE_TRAVEL_NOTICE_TITLE = "Remove Travel Notice"
    static let REMOVE_TRAVEL_NOTICE_SUBTITLE = "Are you sure you want to remove your travel notice?"
    static let SELECT_COUNTRY = "Please select a country"
    static let SELECT_END_DATE = "Please select an end date for your travel notice."
    static let START_DATE_BEFORE_END = "The start date must be before the end date."
    static let TRAVEL_NOTICE_ADDED = "Success! Your travel notice has been submitted."
    static let TRAVEL_NOTICE_DELETED = "Your travel notice has been deleted."
    static let UNABLE_TO_REMOVE_TRAVEL_NOTICE = "Something went wrong. Please try deleting the travel notice again."
    static let REMOVE_TRAVEL_NOTICE_SUBTITLE_ONGOING = "Are you sure you want to delete your travel notice? It will be effective within 24 hours."
    
    //MARK: - DEPOSIT CHECK
    
    static let UNABLE_TO_SAVE_PHOTO = "Unable to save photo due to possible active restrictions such as parental control."
    static let UNABLE_TO_USE_CAMERA = "Unable to use camera due to possible active restrictions such as parental control."
    static let UNABLE_TO_GET_YOUR_LOCATION = "Unable to get your location. Please enable your location from Settings > Privacy > Location Services."
    static let NEEDED_PERMISSION_TITLE = "Need Permission"
    static let NEEDED_PERMISSION_SUBTITLE = "Allow location in your app settings to deposit a check."
    static let CLICK_PERMISSION = "Please allow access to your camera to deposit a check."
    static let SAVE_PERMISSION = "To save a photo of your check, you need to allow Novo to access your photos."
    static let CLICK_IMAGE_TITLE = "Selfie Time!"
    static let SAVE_IMAGE_TITLE = "Save Photo"
    
    //MARK: - CHECK HISTORY
    
    static let CHECK_SAVED = "Your image has been saved to photos."
    static let NEED_PERSSION_TO_SAVE = "Please allow us to access your photos."
    static let NO_DEPOSITED_CHECK = "You have not deposited any checks yet."
    
    //MARK: - LINKED ACCOUNT
    
    static let DELETE_LINKED_ACCOUNT_TITLE = "Delete Linked Account"
    static let DELETE_LINKED_ACCOUNT_SUBTITLE = "Are you sure you want to remove your "
    static let NO_LINKED_ACCOUNTS = "You do not have any linked accounts."
    static let EXTERNAL_ACCOUNT_CONNECTED = "Your external account has been connected successfully."
    
    //MARK: - CONFIRM PASSWORD
    
    static let FORGOT_PASSWORD_TITLE = "Forgot Password"
    static let FORGOT_PASSWORD_SUBTITLE = "To reset your password, you'll need to be logged out. Do you want to proceed?"
    
    //MARK: - ACCOUNT
    
    static let ACCOUNT_NUMBER_COPIED = "Account Number has been copied to clipboard."
    static let ROUTING_NUMBER_COPIED = "Routing Number has been copied to clipboard."
    static let USER_LOGOUT_TITLE = "Going back to work?"
    static let USER_LOGOUT_SUBTITLE = "Are you sure you want to log out?"
    
    //MARK: - COUNTRY
    
    static let NO_COUNTRY_FOUND = "No countries found with that search."
    
    //MARK: - BIOMETRIC
    
    static let BIOMETRIC_TITLE = "Want Faster Logins?"
    
    //MARK: - FORGOT PASSWORD
    
    static let SELECT_DOB = "Please enter your date of birth."
    static let ENTER_SSN = "Please enter the last 4 digits of your SSN."
    static let CONFIRM_OTP = "Please enter the 6 digit code we sent via SMS."
    static let ENTER_VALID_OTP = "Please enter a valid 6 digit code."
    static let OTP_SENT = "Your security code has been sent. You can request a new code again in "
    
    //MARK: - STATEMENTS
    
    static let NO_STATEMENTS = "You do not have any bank statements yet."
    
    //MARK: - SETTINGS
    
    static let ENABLE_NOTIFICATION_TITLE = "Disable Novo notifications"
    static let ENABLE_NOTIFICATION_SUBTITLE = "Please enable notifications for Novo in your device settings."
    static let DISABLE_NOTIFICATION_TITLE = "Enable Novo notifications"
    static let DISABLE_NOTIFICATION_SUBTITLE = "Please disable notifications for Novo in your device settings."
    
    //MARK: - TRANSFERWISE
    
    static let CREATE_VALID_QUOTE = "Please create a valid quote."
    static let DISCONNECT_TRANSFERWISE_TITLE = "Are you sure you want to disconnect?"
    static let DISCONNECT_TRANSFERWISE_SUBTITLE = "If you disconnect your TransferWise account you won’t be able to see TransferWise transactions in Novo"
    static let NO_RESULTS_IN_CATEGORY = "We cannot find any data under this category."
    
    //MARK: - INTEGRATIONS
    
    static let NO_INTEGRATIONS = "There are no integrations yet."
    static let NO_SYNC_HISTORY = "There is no sync history yet."

    //MARK: - ZAPIER
    
    static let CONNECT_ZAPIER_DETAIL = "You will get instant notifications on your desired channel from Zapier"
    static let DISCONNECT_ZAPIER_DETAIL = "Now automate your Novo workflow with Zapier, so you can focus on your most important work"
    static let DISCONNECT_ZAPIER_TITLE = "Zapier"
    static let DISCONNECT_ZAPIER_ALERT_TITLE = "Disconnect Zapier"
    static let DISCONNECT_ZAPIER_ALERT_SUBTITLE = "Are you sure you want to disconnect your Zapier account?"
    
    //MARK: - SLACK
    
    static let RECONNECT_SLACK_TITLE = "Reconnect Slack"
    static let RECONNECT_SLACK_SUBTITLE = "Looks like something is wrong with the connection to your Slack workspace. Please reconnect."
    static let DISCONNECT_SLACK_TITLE = "Disconnect Slack"
    static let DISCONNECT_SLACK_SUBTITLE = "Are you sure you want to disconnect your Slack account?"
    
    //MARK: - CALL
    
    static let CALL_NOTSUPPORT_MESSAGE = "Your device does not support this feature"
    
    //MARK: - EMAIL
    
    static let EMAIL_NOTSUPPORT_MESSAGE = "Your device does not support this feature"

}
