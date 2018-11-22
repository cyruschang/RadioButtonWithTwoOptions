# RadioButtonWithTwoOptions
两个选项的互斥选择按钮，其中用到了一个有意思的数学小知识，遂记录之。

在iOS开发中，`UIView`都可以绑定一个`tag`值，这个值是`NSInteger`类型的。当一个控件是两个互斥类型的时候，可以给其中一个值设置为1，另一个设置为2。这样不管如何，可以通过下面的式子访问到另一个。
````
NSInteger tagOther = !(tag - 1) + 1;
````

如果`tag` = 1， 则`tagOther`为2；
如果`tag` = 2， 则`tagOther`为1。

