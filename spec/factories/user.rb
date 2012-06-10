Factory.define :user, :class => 'User' do |f|
  f.email "vseprav@gmail.ua"
  f.password "password"
  f.password_confirmation "password"
end

