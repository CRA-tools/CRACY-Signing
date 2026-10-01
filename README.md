<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![project_license][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">

<h3 align="center">CRACY signing tool</h3>

  <p align="center">
    Secure, effortless, keyless digital signing through a web interface, REST API, or CI/CD workflows
    <br />
    <a href="https://github.com/CRA-tools/cracy-sign"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://sign.excid.io">View Demo</a>
    &middot;
    <a href="https://github.com/CRA-tools/cracy-sign/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/CRA-tools/cracy-sign/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This repository provides instructions and a Docker Compose configuration for deploying CRACY signing solution locally. 

### Configuration

Copy `.env.example` to `.env` in the same directory as `compose.yml` and replace the example values:


| Variable | Value to set in `.env` |
| --- | --- |
| `OpenId__ClientId` | Your identity provider's OAuth client ID  (see next section)|
| `OpenId__ClientSecret` | Your identity provider's OAuth client secret (see next section) |
| `FULCIO_KEY_PASSWORD` | The password used to encrypt the Fulcio CA key (see next section) |
| `MARIADB_USER` | The application's database username |
| `MARIADB_PASSWORD` | The application's database password |

Fill in all values before starting the services. `.env` is ignored by Git; keep `.env.example` as the shareable template.

#### User Authentication
The CRACY signing tool is using ExcID's [Sign](https://github.com/excid-io/staas) which supports integration with any identity provider compatible with OpenID Connect (OIDC). We will configure the tool to use Google as an Identity Provider. 

- Go to the [Google Cloud Console](https://console.cloud.google.com/).
- Create a new **Google Cloud project**, or select an existing one.
- Open **Google Auth Platform**.
- If this is the first time configuring authentication for the project, select **Get started** and configure:
  - **App name**
  - **User support email**
  - **Audience** (`Internal` or `External`)
  - **Developer contact email**
- Under **Data Access**, make sure the application can request the standard OpenID Connect scopes:
  - `openid`
  - `profile`
  - `email`
- Go to **Google Auth Platform → Clients**.
- Select **Create Client**.
- Choose **Web application** as the application type.
- Enter a name for the OAuth client.
- Under **Authorized redirect URIs** add :

  ```text
  http://localhost:6001/signin-oidc
  ```

- Select **Create**.
- Copy the generated:
  - **Client ID**
  - **Client Secret**

* Set `OpenId__ClientId` and `OpenId__ClientSecret` in `.env` to the values Google generated. 

#### Fulcio CA
ExcID Sign issues short-lived certificates using [Fulcio CA](https://github.com/sigstore/fulcio). Fulcio CA must be configured with a signing key and the corresponding CA certificate. 

Generate a  CA certificate and a key using the following command (**make sure you are using a proper password**)

```
 openssl req -x509 \
        -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 \
        -sha256 \
        -keyout fulcio-key.pem \
        -out fulcio-cert.pem \
        -subj "/CN=fulcioCA" \
        -days 36500 \
        -addext basicConstraints=critical,CA:TRUE,pathlen:1 \
        -passout pass:"123456"
```
Copy files fulcio-key.pem and fulcio-cert.pem in folder `fulcio`. Set `FULCIO_KEY_PASSWORD` in `.env` to the password used to encrypt the key.

### Execution
From a terminal execute:

```
docker compose up -d
```

Then in a browser open http://localhost:6001

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/CRA-tools/cracy-sign/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->
## License

Distributed under the MIT License project_license. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

The CRACY project info@cra-cy.eu

Project Link: [https://github.com/CRA-tools/cracy-sign](https://github.com/CRA-tools/cracy-sign)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Initial contribution by ExcID](https://excid.io)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/CRA-tools/cracy-sign.svg?style=for-the-badge
[contributors-url]: https://github.com/CRA-tools/cracy-sign/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/CRA-tools/cracy-sign.svg?style=for-the-badge
[forks-url]: https://github.com/CRA-tools/cracy-sign/network/members
[stars-shield]: https://img.shields.io/github/stars/CRA-tools/cracy-sign.svg?style=for-the-badge
[stars-url]: https://github.com/CRA-tools/cracy-sign/stargazers
[issues-shield]: https://img.shields.io/github/issues/CRA-tools/cracy-sign.svg?style=for-the-badge
[issues-url]: https://github.com/CRA-tools/cracy-sign/issues
[license-shield]: https://img.shields.io/github/license/CRA-tools/cracy-sign.svg?style=for-the-badge
[license-url]: https://github.com/CRA-tools/cracy-sign/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/company/cracy/
[product-screenshot]: images/screenshot.png

