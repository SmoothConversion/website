
Smooth Conversion Website
=========================

Setup steps:
------------

- Clone the project and run a `bundle install`.

- Install s3cmd with brew: `brew install s3cmd`

- Get [Smooth Conversion s3 credentials](https://console.aws.amazon.com/iam/home?#security_credential) and configure s3cmd: `s3cmd --configure s3://smoothconversion`

- Install the [livereload browser extension](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en)

- To run the middleman server, just run `middleman`

- Make sure your livereload is connected for automatic page refreshes

- To deploy, run the deploy script `./deploy.sh`

- Changes will take at least several minutes to show up live due to CloudFront caching.
