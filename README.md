# react-native-buzz

react native package to vibrate device for IOS , UNDER DEVELOPMENT FOR ANDROID.

## Installation

```sh
npm install react-native-buzz
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
    Buzz.vibrateLowIntensity(0.5)
}
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---
