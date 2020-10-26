# 概述
这是可直接依赖OpenFL使用的刀光效果。

# 测试
```haxe
lime test html5
```

# 示例
```haxe
var knife = new KnifeLight(Assets.getBitmapData("assets/color2.png"),20,0.2); //位图,粗细,持续时间
this.addChild(knife);
```