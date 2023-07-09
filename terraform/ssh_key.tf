data "http" "github" {
  url = "https://github.com/honahuku.keys"
}

resource "vultr_ssh_key" "github" {
  name    = "github"
  ssh_key = chomp(data.http.github.response_body)
}
