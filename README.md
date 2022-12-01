# MarkLogic Rewriter Endpoint Viewer
This is a Swagger-like viewer for MarkLogic `rewriter.xml` files.

To enable this, add the following to the project's `rewriter.xml`:

```xml
	<match-method any-of="GET HEAD">
		<match-path matches="^/?$">
			<dispatch>/rewriter-viewer/default.xqy</dispatch>
		</match-path>
	</match-method>
```

__Note:__ You can change the path to anything that makes sense, e.g. `^/swagger/?$`.

__Note:__ This assumes that this project is located in a `rewriter-viewer` folder
of your application's app-server root. If this is different, edit the `dispatch`
path to point to the correct location.

## Documenting The Rewriter XML
This endpoint viewer uses
[Dublin Core Elements](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/#section-3)
in the `http://purl.org/dc/elements/1.1/` namespace to annotate the various parts
of the rewriter file. This section documents the supported annotations.

Documentation such as the description uses XHTML -- that is, HTML documentation in
the XHTML `http://www.w3.org/1999/xhtml` namespace.

### Top-Level Documentation
| Element          | Type     | Description                                         |
|------------------|----------|-----------------------------------------------------|
| `dc:title`       | `text()` | The title of the rewriter file.                     |
| `dc:description` | XHTML    | The top-level description.                          |
| `dc:rights`      | `text()` | The copyright statement for the rewriter endpoints. |

## License
Copyright (C) 2022 Reece H. Dunn

This project is licensed under the [Apache 2.0](LICENSE) license.
