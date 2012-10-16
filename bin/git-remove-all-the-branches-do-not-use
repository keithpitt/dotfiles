repos = `git branch -r`

def run(cmd)
  p cmd
  p `#{cmd}`
end

repos.split("\n").each do |r|
  x = r.split("/")[1]
  if x != "HEAD -> origin"  && x != "master"
    p "Removing #{x}"
    run "git push origin :#{x}"
  end
end
