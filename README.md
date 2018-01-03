# zhwei-secKill
## 秒杀流程 ##

1.用户首先进入商品秒杀页面，当到达秒杀时间时前端的下单按钮才能点亮；

2.点击以后并不是所有用户都能到达下单页面，1W+用户同时下单可能就只有20个用户才能进入下单页面，其他的用户直接到达秒杀结束页面，此时步骤可以使用Redis的单线程特性来统计和控制下单人数；

3.成功进入填写订单页面的用户填写完订单以后再次提交订单，虽然此时并发请求数量最多只有20，但是我们还是需要使用Redis的单线程特性来统计和控制能真正下单的人数，此时能秒杀成功的可能只有最早提交订单的2个用户，剩下的18位用户直接返回秒杀失败页面；

4.此时将成功的两位用户的下单任务加入消息队列RabbitMQ，让下单页面负责真正的创建订单，商品库存的减少以及后续其他相关操作；

5.返回给两位用户的只要一个秒杀成功页面和支付页面即可。


![这里写图片描述](http://img.blog.csdn.net/20180103131632961?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzcxNjk4MTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)


任务职责：
-----
1.前端页面需要用JS控制下单按钮的关启，没到秒杀时间不允许出现下单的URL，防止有人作弊。

![这里写图片描述](http://img.blog.csdn.net/20180103131618438?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzcxNjk4MTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

2.可能有用户直接知道下单页面，那么后台需要对于请求进行进行判断，如果请求的时间没有到达秒杀时间就直接返回警告页面。

![这里写图片描述](http://img.blog.csdn.net/20180103133903795?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzcxNjk4MTc=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

3.对于高并发的秒杀请求，我需要对其计数，使得只有一小部分用户才可以进入下单页面，其他的用户直接返回一个失败页面即可，这样就减少服务器的压力。而统计请求数可以使用Redis，其单线程的特点很好的满足了我们的需求，如果并发量确实很大，可以使用Redis集群。

4.进入下单页面的用户此时大大减少，但是仍然存在高并发带来的问题，此时我们又需要用Redis控制下单成功的用户，此时可能只有前几位下单成功的用户进入下单页面，其他的用户直接返回秒杀失败页面即可。

5.下单成功的可以加入任务队列RabbitMQ，告诉下单系统和库存系统去处理后序的相关操作，我们只需要返回用户一个下单成功和支付页面即可。


对于超高并发的秒杀，我们可以做负载均衡，秒杀页面可以静态化的缓存在CDN服务器中，这样用户反复刷新页面并不会请求服务器，此外我们的Redis就需要集群了。
