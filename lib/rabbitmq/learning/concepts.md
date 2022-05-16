# RabbitMQ

Your app can be a producer when it needs to send a message to another app, or it can be a consumer when it needs to receive.


By connecting, you’re creating a TCP connection between your app and the Rabbit bro-
ker. Once the TCP connection is open (and you’re authenticated), your app then cre-
ates an AMQP channel.