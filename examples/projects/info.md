# JSON Documentation

This JSON object is structured as follows:

```
{
    "name": "",
    "description": "",
    "publisher": {
        "name": "",
        "website": ""
    },
    "developers": [
        {
            "githubUserName": "",
            "companyName": null
        }
    ],
    "releaseData": "",
    "links": {
        "appstore": null,
        "playstore": null,
        "website": null,
        "youTube": null,
        "demoYouTubeVideo": null
    }
}
```

## File location

/projects/your_project/info.json

## Properties

### `name`

- Data type: string
- Description: Represents the name of the application.
- Constraints: None.

### `description`

- Data type: string
- Description: Represents a brief description of the application.
- Constraints: None.

### `publisher`

- Data type: object
- Description: Represents the publisher of the application.
- Constraints: None.

#### `name`

- Data type: string
- Description: Represents the name of the publisher.
- Constraints: None.

#### `website`

- Data type: string
- Description: Represents the website of the publisher.
- Constraints: None.

### `developers`

- Data type: array
- Description: Represents the developers of the application.
- Constraints: None.

#### `githubUserName`

- Data type: string
- Description: Represents the GitHub username of the developer.
- Constraints: None.

#### `companyName`

- Data type: string or null
- Description: Represents the name of the company the developer is associated with or null if not available.
- Constraints: None.

### `releaseData`

- Data type: string
- Description: Represents the release date of the application.
- Constraints: None.

### `links`

- Data type: object
- Description: Represents a collection of links related to the application.
- Constraints: None.

#### `appstore`

- Data type: string or null
- Description: Represents the link to the application's listing on the Apple App Store or null if not available.
- Constraints: None.

#### `playstore`

- Data type: string or null
- Description: Represents the link to the application's listing on the Google Play Store or null if not available.
- Constraints: None.

#### `website`

- Data type: string or null
- Description: Represents the link to the application's website or null if not available.
- Constraints: None.

#### `youTube`

- Data type: string or null
- Description: Represents the link to the application's YouTube page or null if not available.
- Constraints: None.

#### `demoYouTubeVideo`

- Data type: string or null
- Description: Represents the link to a demo video of the application on YouTube or null if not available.
- Constraints: None.

## Example

```
{
    "name": "My App",
    "description": "This is an awesome app!",
    "publisher": {
        "name": "My Company",
        "website": "https://mycompany.com"
    },
    "developers": [
        {
            "githubUserName": "johndoe",
            "companyName": null
        }
    ],
    "releaseData": "2023-01-01",
    "links": {
        "appstore": "https://appstore.com/myapp",
        "playstore": "https://playstore.com/myapp",
        "website": "https://myapp.com",
        "youTube": "https://youtube.com/myapp",
        "demoYouTubeVideo": "https://youtube.com/myappdemo"
    }
}
```