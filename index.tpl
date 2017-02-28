HOST: https://api.dolzer.com/v1
# {{ .Name }}
## General notes
{{ .Description }}
## API Details
{{ range .Folders }}
## {{ .Name }} [{{ .Description }}]
{{ range .Order }}{{ with $req := findRequest $.Requests . }}
### {{ $req.Name }} [{{ $req.Method }}]
{{if $req.Description }}{{ $req.Description }}{{ end }}
{{ with $req.Responses }}{{ range $index, $res := . }}+ Request {{ $res.Name }}
{{if $res.Request.Headers }}    + Headers
{{ range $res.Request.Headers }}
            {{ .Key }}: {{ .Value }}{{ end }}
{{ end }}
{{ if $req.RawModeData }}    + Body
            {{ $req.RawModeData }}
{{ end }}
+ Response {{ $res.ResponseCode.Code }}
    + Headers
{{ range $res.Headers }}
            {{ .Key }}: {{ .Value }}{{ end }}

    + Body
{{ with $example := $res.Text }}
            {{ $example }}
{{ end }}{{ end }}{{ end }}{{ end }}{{ end }}{{ end }}
