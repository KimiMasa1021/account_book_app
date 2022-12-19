#!/bin/sh

#コミットメッセージ
echo "コミットメッセージを入力してね"
read MESSAGE


git add .
git commit -m "$MESSAGE"
git push origin main 



