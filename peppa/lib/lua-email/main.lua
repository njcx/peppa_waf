init(0,0)

snapshot("[public]a.png",200,200,500,500)
mSleep(300)
snapshot("[public]b.png",0,0,500,500)
mSleep(300)
snapshot("[public]c.png",0,0,getScreenSize())
mSleep(300)

local email = require("email163")
email = email.new({
    name="羽123", -- 发送人名称
    server="smtp.163.com", -- SMTP服务器地址
    user="xxxx@163.com", -- 邮箱用户名
    password="xxxxx",-- 邮箱密码
    html=true -- 是否使用html格式发送
})
local email_data = {
    to={"<99659462@qq.com>","<997878604@qq.com>"},-- 收件人
    title="邮箱标题", -- 邮箱标题
    body="<h1><font color='red'>asfsaf</font></h1>", -- 发送内容
    cc="<997878604@qq.com>", -- 抄送
    -- 多附件发送
    file={
        {type='image/png; name="image0.png"',path="[public]a.png"},
        {type='image/png; name="image1.png"',path="[public]b.png"},
        {type='image/png; name="image2.png"',path="[public]c.png"}
    }
}

local r,e = email.send(email_data)
sysLog(e)
