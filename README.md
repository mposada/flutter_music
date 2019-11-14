# workshop

Spotify based demo

## Getting Started

Create a Spotify account and enable the [developer option](https://developer.spotify.com), then create a project and take the Client Id and Secret Id and generate a token like this:

**POST** Request to: https://accounts.spotify.com/api/token

##Body: 

As a x-www-form-urlencoded 
`grant_type: client_credentials`

## Authorization
`Basic client_id:secret_id`

## Response

`{
    "access_token": "BQANO7pbhbHVLTpaDMGziC3mbVEDyrO_RqLuCqgmO3Qd1ypqKT6nD8YCkSYAcXI_DZUauJ_cTdleeCpRwKA",
    "token_type": "Bearer",
    "expires_in": 3600,
    "scope": ""
}`

--------------------------
A few resources to get you familiar with Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
