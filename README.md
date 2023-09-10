# Vlang MCUUID

Simple Minecraft IGN/UUID lookup library (Inspired by [MCUUID PyPi](https://pypi.org/project/mcuuid/)) written in Vlang


## Example

```v
import mcuuid { mcuuid }


fn main() {
    // Fetch uuid by username
	player := mcuuid("illyum")
    println("Your UUID is: " + player.uuid)
    
    // Fetch name by uuid
	player := mcuuid("24c182c6-716b-47c6-8f60-a1be9045c449")  // '-' are optional
    println("Your name is: " + player.name)
}
```

## Notes

- Currently there isn't any error handling/checking
- Only runs synchronously (no async)
- Made with Vlang 0.4.1 [9a4fbc](https://github.com/vlang/v/tree/92b551f2773d82b5a2c8b20636f7eec0b3e3f8c1)

## Contributing

If you'd like to contribute, feel free. Probably only going to be me using this anyways...

## Authors

[@illyum](https://github.com/itzilly)

## Version History

* 0.2
    * Remove redundant struct
* 0.1
    * Initial Release

## License

This project is licensed under the MIT License - see the LICENSE file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [MCUUID Github](https://github.com/clerie/mcuuid)