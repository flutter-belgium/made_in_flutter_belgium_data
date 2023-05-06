# JSON Documentation

This JSON object is structured as follows:

```
{
    "name": "",
    "description": "",
    "links": {
        "linkedin": null,
        "personalWebsite": null,
        "freelanceWebsite": null,
    }
}
```

## File location

/developers/your_github_username/info.json

## Properties

### `name`

- Data type: string or null
- Description: Represents the full name of the developer.
- Constraints: None.

### `description`

- Data type: string or null
- Description: Represents a brief description of the developer.
- Constraints: None.

### `links`

- Data type: object
- Description: Represents a collection of links related to the developer.
- Constraints: None.

#### `personalWebsite`

- Data type: string or null
- Description: Represents the link to the developers's personal website or null if not available.
- Constraints: None.

#### `freelanceWebsite`

- Data type: string or null
- Description: Represents the link to the developers's freelance website or null if not available.
- Constraints: None.

#### `linkedin`

- Data type: string or null
- Description: Represents the link to the developers linkedin or null if not available.
- Constraints: None.


## Example

```
{
    "name": "My Full Name",
    "description": "This is a description about myself",
    "links": {
        "linkedin": "https://linkedin.com",
        "website": "https://mywebsite.com",
    }
}
```