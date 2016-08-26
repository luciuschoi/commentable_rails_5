# 레일스 다형성 관계를 이용한 댓글기능 구현하기


## 코딩환경

- 루비 2.3.1
- 레일스 5.0.0.1
- 터보링크 5.0

## 사용할 젬

```ruby
gem 'bootstrap', '~> 4.0.0.alpha3.1'
gem 'simple_form'
gem 'jquery-ui-rails'
```

## 구현내용 목록

- [![유투브이미지](https://www.android.com/static/img/tv/apps/youtube.png)](https://youtu.be/0eF7fFVg_Cw)

- Polymorphic association of Comment Model
Comment 모델 객체를 타 모델 객체에 polymorphic 관계로 연결 (모델 제너레이터를 이용)

- Comment 모델의 유효성 검증 코드 작성

- Comments 컨트롤러의 생성
`create`, `update`, `destroy` 액션 작성 (컨트롤러 제너레이터 이용)

- 레일스용 Ajax 코드 작성
`create.js.erb`, `update.js.erb`, `destroy.js.erb` 코드 작성

- Comment 모델 유효성 검증 오류시 Ajax로 표시

- 댓글 작성시 남은 글자수를 표시하기 위한 자바스크립트 작성

- `jquery-ui`를 이용하여 ajax 동작 효과표시


### references

- http://v4-alpha.getbootstrap.com/getting-started/introduction/#starter-template
- http://hangul.thefron.me/
- http://www.robertlysik.com/?p=231
- https://github.com/twbs/bootstrap-rubygem
- https://github.com/plataformatec/simple_form
