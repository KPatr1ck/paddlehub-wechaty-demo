# paddlehub-wechaty-demo

本例子展示一个基于PaddleHub + Wechaty 的微信聊天机器人demo。通过Wechaty获取到微信的消息文本，然后经过PaddleHub的lac模型进行切词，最终以微信消息的形式返回切词后的结果。  

## Wechaty

关于Wechaty和python-wechaty，请查阅以下官方repo：
- [Wechaty](https://github.com/Wechaty/wechaty)
- [python-wechaty](https://github.com/wechaty/python-wechaty)
- [python-wechaty-getting-started](https://github.com/wechaty/python-wechaty-getting-started/blob/master/README.md)


## 环境准备

- 系统环境：Linux, MacOS, Windows
-  python3.7+


## 安装和使用

1. Clone本项目代码

   ```shell
   git clone https://github.com/KPatr1ck/paddlehub-wechaty-demo.git
   cd paddlehub-wechaty-demo
   ```

2. 安装依赖 —— paddlepaddle, paddlehub, wechaty

   ```shell
   pip install -r requirements.txt
   ```

3. 安装项目所需的paddlehub的module

    此demo以`lac`为示例，其他module根据项目所需安装，更多的模型请查阅[paddlehub官网](https://www.paddlepaddle.org.cn/hublist)。
   ```shell
   hub install lac==2.2.0
   ```

3. Set token for your bot

    在当前系统的环境变量中，配置以下与`WECHATY_PUPPET`相关的两个变量。
    关于其作用详情和TOKEN的获取方式，请查看[Wechaty Puppet Services](https://wechaty.js.org/docs/puppet-services/)。
    ```shell
    export WECHATY_PUPPET=wechaty-puppet-service
    export WECHATY_PUPPET_SERVICE_TOKEN=your_token_at_here
    ```
    
    [Paimon](https://wechaty.js.org/docs/puppet-services/paimon/)的短期TOKEN经测试可用，其他TOKEN请自行测试使用。

4. Run the bot

   ```shell
   python examples/paddlehub-bot.py
   ```
   运行后，可以通过微信移动端扫码登陆，登陆成功后则可正常使用。
