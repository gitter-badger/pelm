require 'rubygems'

desc "Publish docs to gh-pages "
task :docs do
  cd "./docs" do 
    deploy_dir = "./_deploy"
    if !File.exists? deploy_dir  then 
      sh 'git clone git@github.com:eggcaker/pelm.git -b gh-pages _deploy'
    end 

    sh "jekyll "
    sh "cp -r ./_site/* ./_deploy/"
    sh "rm -rf _site"
    cd "./_deploy" do
      sh "git add . "
      sh "git commit -m 'gh-pages generated'"
      sh "git push origin gh-pages -f "
    end
    
  end 
  
end

