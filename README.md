# FeverPreference
用法方便的持久化库。

基于监听property set方法实现MMKV、NSUserDefaults的封装

1.在MFFPreference init时读取所有属性对应在MMKV及NSUserDefaults里的值，并通过kvc设置给相应属性
2.在MFFPreference init时给每个属性添加observer
3.当属性值被set时 存储属性值给到MMKV或NSUserDefaults
4.MMKV主要存取NSString、NSDictionary、NSArray等有class 方法的数据 NSUserDefaults会存储BOOL、NSInteger等小型数据
5.由于MMKV用法的取值时需要传入对应的class （此处的获取属性class的方法来自Mantle）
6.现在的问题是用法的迁移，之前的定好的很多key，可能不适合作为property，同时之前数据转MMKV存储也是有一部分小坑的。所以建议大家可以在加新key时使用。

[![CI Status](https://img.shields.io/travis/Fever/FeverPreference.svg?style=flat)](https://travis-ci.org/Fever/FeverPreference)
[![Version](https://img.shields.io/cocoapods/v/FeverPreference.svg?style=flat)](https://cocoapods.org/pods/FeverPreference)
[![License](https://img.shields.io/cocoapods/l/FeverPreference.svg?style=flat)](https://cocoapods.org/pods/FeverPreference)
[![Platform](https://img.shields.io/cocoapods/p/FeverPreference.svg?style=flat)](https://cocoapods.org/pods/FeverPreference)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements


## Installation

FeverPreference is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FeverPreference'
```
继承自MFFPreference，添加属性即可享受丝滑持久化服务

## Author

Fever, 450118418@qq.com

## License

FeverPreference is available under the MIT license. See the LICENSE file for more info.
