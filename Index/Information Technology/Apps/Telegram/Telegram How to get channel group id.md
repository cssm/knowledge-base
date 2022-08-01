# How to get channel/group id

## Channel

@<channelName> == https://t.me/<channelName>

Add bot to chanel as admin

1. You should convert it to public with some @channelName
2. Send message to this channel through Bot API
    
    [https://api.telegram.org/bot<bot_token>/sendMessage?chat_id=@channelName&text=123](https://api.telegram.org/bot111:222/sendMessage?chat_id=@channelName&text=123)
    
3. As response you will get info with chat_id of your channel.
{ "ok" : true, "result" : { "chat" : { **"id" : -1001005582487,** "title" : "Test Private Channel", "type" : "channel" }, "date" : 1448245538, "message_id" : 7, "text" : "123ds" } }
4. Now you can convert Channel back to private (by deleting channel's link) and send message directly to this chat_id "-1001005582487"[https://api.telegram.org/bot<bot_token>/sendMessage?chat_id=-1001005582487&text=123](https://api.telegram.org/bot111:222/sendMessage?chat_id=-1001005582487&text=123)

## Group

In order to get the group chat id, do as follows:

1. Add the Telegram BOT to the group.
2. Get the list of updates for your BOT:
    
    ```
     https://api.telegram.org/bot<YourBOTToken>/getUpdates
    ```
    
3. Look for the "chat" object:

> {"update_id":8393,"message":{"message_id":3,"from":{"id":7474,"first_name":"AAA"},"chat":{"id":<group_ID>,"title":""},"date":25497,"new_chat_participant":{"id":71,"first_name":"NAME","username":"YOUR_BOT_NAME"}}}
> 

This is a sample of the response when you add your BOT into a group.

1. Use the "id" of the "chat" object to send your messages.
2. If you created the new group with the bot and you only get `{"ok":true,"result":[]} :` 
    1. Send command to the bot
    2. remove and add the botRagain to the group