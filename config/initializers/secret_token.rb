# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Webhook::Application.config.secret_key_base = '09eeb5fda9bb15308f8cc3871366b5aad86025a693dfc5961f2ffac1c5ffe9221e1612056d067757fc7a319fe7675ccd4d5f8cf586f7f2795c07eeefb5479de8'
