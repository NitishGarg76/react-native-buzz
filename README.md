# react-native-buzz

A React Native module to vibrate device for both IOS and Android. 

## Installation

```sh
npm install react-native-buzz
```
## Android

Add below permission in AndroidMenifest.xml
```js
<uses-permission android:name="android.permission.VIBRATE" />
```
## IOS
```js
run pod install
```
## Usage

```js
import Buzz from 'react-native-buzz';

const vibrate = () =>{
    //To vibrate the device use below
    Buzz.vibrate()
    //To vibrate device at dezired Intensity use below
    Buzz.vibrateAtIntensity(0.5)
}
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---
