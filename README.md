# peppa_waf ：

#### an open source waf (Web Application Firewalls) base on Tengine-2.2.2 and luajit2.1.0，jemalloc-5.1.0

### 包括如下模块：


1，规则处理引擎：加载规则,实时分析处理请求,拦截异常流量

2，API接口模块: 动态添加规则,相关模块的启停



### 功能

1，IP黑白名单,URL(正则URL)/域名(正则域名)/泛域名黑名单

2，CC防御,域名/URL限流

3, Get/Post/UA等恶意参数拦截

 

### 安装

#sudo apt-get install libpcre3 libpcre3-dev openssl wget libssl-dev

#yum install pcre pcre-devel openssl openssl-devel zlib-devel wget

#cd lua && make && make install

#cd /usr/local/src && wget https://github.com/jemalloc/jemalloc/releases/download/5.1.0/jemalloc-5.1.0.tar.bz2 && tar xvf jemalloc-5.1.0.tar.bz2 && cd jemalloc-5.1.0 && ./configure --prefix=/usr/local/jemalloc && make && make install

#echo "/usr/local/lib" >> /etc/ld.so.conf

#ldconfig

先安装 luajit

然后安装tengine

#./configure --prefix=/usr/local/nginx --with-jemalloc=/usr/local/src/jemalloc-5.1.0 --with-http_lua_module --with-luajit-lib=/usr/local/lib/ --with-luajit-inc=/usr/local/include/luajit-2.1/ --with-lua-inc=/usr/local/include/luajit-2.1/ 

#make && make install



