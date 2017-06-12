{{/* =% sh %= */}}

{{ $output := `docker.yml` }}
infrakit template -o {{$output}} - <<EOF
{{ source "docker.yml" }}
EOF

echo "Running moby."

moby build {{$output}}

{{ $bundle := `docker` }}
echo "Checksum:"{{ fetch (cat `file://` (env `PWD`) $bundle "-initrd.img" | nospace) | sha256sum }}
