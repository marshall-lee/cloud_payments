$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'cloud_payments'
require 'rack'
require 'pp'

app = ->(env){
  pp env
  pp Rack::Request.new(env).params

  json = <<-JSON
    {
      "Model":{
        "TransactionId": 12345,
        "Amount": 120,
        "Currency": "RUB",
        "CurrencyCode": 0,
        "InvoiceId": "1234567",
        "AccountId": "user_x",
        "Email": null,
        "Description": "Payment for goods on example.com",
        "JsonData": null,
        "CreatedDate": "\/Date(1401718880000)\/",
        "CreatedDateIso":"2014-08-09T11:49:41",
        "AuthDate": "\/Date(1401733880523)\/",
        "AuthDateIso":"2014-08-09T11:49:42",
        "ConfirmDate": "\/Date(1401733880523)\/",
        "ConfirmDateIso":"2014-08-09T11:49:42",
        "AuthCode": "123456",
        "TestMode": true,
        "IpAddress": "195.91.194.13",
        "IpCountry": "RU",
        "IpCity": "Ufa",
        "IpRegion": "Bashkortostan Republic",
        "IpDistrict": "Volga Federal District",
        "IpLatitude": 54.7355,
        "IpLongitude": 55.991982,
        "CardFirstSix": "411111",
        "CardLastFour": "1111",
        "CardType": "Visa",
        "CardTypeCode": 0,
        "IssuerBankCountry": "RU",
        "Status": "Completed",
        "StatusCode": 3,
        "Reason": "Approved",
        "ReasonCode": 0,
        "CardHolderMessage": "Payment successful",
        "Name": "CARDHOLDER NAME",
        "Token": "a4e67841-abb0-42de-a364-d1d8f9f4b3c0"
      },
      "Success":true,
      "Message":null
    }
  JSON

  [200, { 'Content-Type' => 'application/json' }, [json]]
}

run app
