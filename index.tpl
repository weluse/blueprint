HOST: https://api.dolzer.com/v1
# {{ .Name }}

## General notes

{{ .Description }}

<!-- {{ with $structures := .Structures }}

## API structures

{{ range $structures }}

### {{ .Name }}

{{ .Description }}

<table class="table table-bordered">
{{ range .Fields }}
<tr>
    <th>{{ .Name }}</th>
    <td>{{ .Type }}</td>
    <td>{{ .Description }}</td>
</tr>
{{ end }}
</table>

{{ end }}

{{ end }} -->

## API Details

{{ range .Folders }}
## {{ .Name }}

{{ .Description }}

{{ range .Order }}

{{ with $req := findRequest $.Requests . }}

### {{ $req.Name }} [{{ $req.Method }}]
{{ $req.Description }}
+ Request

    + Headers

            {{ $req.Headers }}

    + Body

            {{ $req.RawModeData }}

{{ with $req.Responses }}{{ range $index, $res := . }}
+ Response {{ $res.ResponseCode.Code }}
    + Headers
{{ range $res.Headers }}
              {{ .Key }}: {{ .Value }}{{ end }}

    + Body

{{ with $example := $res.Text }}
          {{ $example }}
{{ end }}
{{ end }}



{{ end }}

{{ end }}

{{ end }}

{{ end }}
