# awsome-map

## Rails5アプリケーションの準備

Gemfileを作る。

```
bundle init
```

```ruby
# Gemfile
gem 'rails', github: 'rails/rails'
```

```bundle install```する

```
bundle install
```

```Rails new```を現在のディレクトリで実行する。  
Gemfileを上書きする。

```
bundle exec rails new .

Overwrite /vagrant/awsome-map/README.md? (enter "h" for help) [Ynaqdh] n
Overwrite /vagrant/awsome-map/Gemfile? (enter "h" for help) [Ynaqdh] Y
```

## とりあえずのコントローラ

とりあえずのコントローラを作ってルートを設定する。

```
rails g controller top index
```

```ruby
# config/routes.rb
Rails.application.routes.draw do

  root 'top#index'

end
```

## チャンネルを作る

talkチャンネルを作る

```
rails g channel talk
```


