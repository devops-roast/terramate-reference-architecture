terramate {
  config {
    git {
      default_remote = "origin"
      default_branch = "main"

      check_remote      = false
      check_untracked   = false
      check_uncommitted = false
    }
  }
}
