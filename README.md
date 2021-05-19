# paddlehub-wechaty-demo

本例子展示一个基于 PaddleHub + Wechaty 的微信闲聊机器人demo。通过Wechaty获取微信接收的消息，然后使用PaddleHub的`plato-mini`模型根据对话的上下文生成新的对话文本，最终以微信消息的形式发送，实现闲聊的交互。

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

3. 安装项目所需的PaddleHub的module

    此demo以`plato-mini`为示例，其他module根据项目所需安装，更多的模型请查阅[PaddleHub官网](https://www.paddlepaddle.org.cn/hublist)。
   ```shell
   hub install plato-mini==1.0.0
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
   python examples/paddlehub-chatbot.py
   ```
   运行后，可以通过微信移动端扫码登陆，登陆成功后则可正常使用。

## 运行效果

在`examples/paddlehub-chatbot.py`中，通过以下几行代码即可实例化一个`plato-mini`的模型，关于模型的更多用法，请查看[PaddleHub: plato-mini](https://www.paddlepaddle.org.cn/hubdetail?name=plato-mini&en_category=TextGeneration)。

```python
# Initialize a PaddleHub plato-mini model
import paddlehub as hub

model = hub.Module(name='plato-mini', version='1.0.0')
model._interactive_mode = True  # 开启交互模式
model.max_turn = 10             # 对话轮次配置
model.context = deque(maxlen=model.max_turn)  # 对话上下文的存储队列
```

脚本成功运行后，所登陆的账号即可作为一个Chatbot，下图右侧的内容由Chatbot生成和回复。

[![gIZF5F.md.jpg](https://z3.ax1x.com/2021/05/19/gIZF5F.md.jpg)](https://imgtu.com/i/gIZF5F)
[![gIZiUU.md.jpg](https://z3.ax1x.com/2021/05/19/gIZiUU.md.jpg)](https://imgtu.com/i/gIZiUU)
