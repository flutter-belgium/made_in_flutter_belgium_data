# JSON Documentation

This JSON object is structured as follows:

```
{
    "name": "",
    "description": "",
    "useLogoInsteadOfTextTitle": false,
    "links": {
        "website": null
    }
}
```

## File location

/companies/your_company/info.json

## Properties

### `name`

- Data type: string
- Description: Represents the name of the object.
- Constraints: None.

### `description`

- Data type: string
- Description: Represents a description of the object.
- Constraints: None.

### `links`

- Data type: object
- Description: Represents a collection of links related to the object.
- Constraints: None.

### `useLogoInsteadOfTextTitle`

- Data type: boolean
- Description: If set to true the logo of the company will be used as title instead of text.
- Default: false
- Constraints: None.

#### `website`

- Data type: string or null
- Description: Represents a link to the object's website, or null if not available.
- Constraints: None.

## Example

```
{
    "name": "Example Company",
    "description": "This is an example company description.",
    "useLogoInsteadOfTextTitle": false,
    "links": {
        "website": "https://example-company.com"
    }
}
```