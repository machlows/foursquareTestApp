# foursquareTestApp
This App was build using VIPER pattern to increase code readability, give good logic separation and improve testing process.
App is not using any external dependencies, networking layer is based on UrlSesion and mapping json is done by implementing Decodable protocol. Not using external libraries gives full control over functionality and keeps project size small.

App has only one view with table view and search control, after you type something into search controll app will send request to api to get venues with typed name and currnet user location.
