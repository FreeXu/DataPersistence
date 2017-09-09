# DataPersistence
数据持久化处理；
数据持久化整理五中方法；分别为：
1.plist直接写文件；
 特性：轻量级保存；一般用于存储简单的数据（NSData，NSArray，NSDictionary，NSString，NSNumber）；
 缺点：不能保存自定义类型数据；

2.NSUserDefault保存数据；
 说明：用户偏好设置保存文件；
 特性：轻量级保存；一般用于存储简单的数据（NSData，NSArray，NSDictionary，NSString，NSNumber）；
 缺点：不能保存自定义类型数据；明文存储，安全性弱；

3.NSKeyedArchiver保存数据，归档；
 说明：归档保存文件；
 特性：轻量级保存；遵循NSCoding，进行加密保存；可以保存自定义类型；轻量级保存；
 
 4.FMDB保存，第三发；封装oc的sqlite数据库，进行数据存储；
 优点：
    a.多线程安全；
    b.使用OC对sqlite的API进行封装，使用起来更方便；
    c.轻量级存储，易用；
 缺点：
    用OC进行封装的，不能跨平台；
    
 5.CoreData



