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

## License
Copyright (C) 2022 Reece H. Dunn

This project is licensed under the [Apache 2.0](LICENSE) license.
