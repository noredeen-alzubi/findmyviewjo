# FindMyView JO

## Note:

> :exclamation: This is the new home of the FindMyView project. The code has been migrated to this repository ([link to the old one](https://github.com/noredeen-alzubi/findmyview)). The biggest changes include:
* Abandoning Webpack for Sprockets. Webpack is still set up in the codebase should it become necessary as the application grows, but is not used at the moment.
* Downgrading to Bootstrap 3 for compatability with certain important gems. We are overriding Bootstrap's CSS when the styling is not satisfactory.

---

<br>

### 🏞🌇🏙 _An Airbnb-like website for finding stunning views in Jordan._  🌉🌌🌁

<br>

## Features at a glance:
* Users with privilages (without a gem like Devise).
* Advanced searching/filtering/sorting of views.
* Reviews with star ratings.
* Location data as Google Maps iframes.
* Image galleries powered by Amazon S3.


## 🛑 Known issues & bugs:
* Bad addresses are not caught and handled. If a view's address is set, for example, over the ocean where the is no 'state' attribute, a nil error will be raised when parse that value.
* Geocoder errors in general are not handled well. The app is configured to raise them all at the moment.
* No pagination for view reviews. The page's height will increase endlessly as more reviews are added. The same issue is present with the views themselves (in 'index').
* Model destruction is still buggy. If the last and only view that belongs to a city is destroyed, the city is not always destroyed with it.

## 🛠 Features backlog:
* Drop a pin on a map instead of entering in logitude and latitude to submit views.
* Paginate views and their ratings.
