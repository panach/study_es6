
# ES6 그냥 시작해보자
이문서는 누구나 수정/업데이트가 가능하다.  
예제 추가 및 오타 수정 또한 절실하다.
이 문서는 한번 그냥 해보자라는 식으로 시작했다.
airbnb의 Javascript 스타일 가이드를 기준으로 학습했다.
## 뭐냐?
Javascript가 1995년....웃기지 마라. 
그냥 여러 브라우저에서 동일하게 동작하기 위해 표준 규격이 필요했고 ECMA 국제 기구에서 *ECMAscript Standard* 라는 표준을 정립했으며, 
javaScript 는  ECMAScript 와 BOM(Browser Object Model) 과 DOM(Document Object Model)이라는 1개의 코어와 2개의 모델로 이루어졌다. 그렇다는건 javascript 와 ECMAscript 는 다른놈이다. 같다고 생각지 말자. 뭐...아예 남도 아니지만..
줄여서 ES 라 부리우며 ES6 는 2015년도에 만들어졌...그게 뭐가 중요하겠냐.
## 기타
### 작은따옴표
문자열을 감싸는 방법으로 "", '' 두개 중 한가지로 감싸는 방법이 있는대 기본으로 '' 작은 따옴표로 감싸는것을 기본으로 한다. 표현이나 가독성에 더 좋다
"" 로 문자를 감싸을 경우 내부에 " 문자가 왔을때 귀찮아 진다.


```js
var a = "<a href=\"" + url + "\">"  // "" 시작할때
var b = '<a href="' + url + '">'    // '' 시작할때
```
## 형(Types)
원시형은 그 값을 직접 조작
> string  
 number  
 boolean  
 null  
 undefined  

```js
const a = 1; 
let b = a;

b = 4;

console.log(a, b) // 1, 4
```

참조형은 참조를 통해 값을 조작
> Object  
array  
function

```js
const a = [1, 2];
const b = a;

b[0] = 5;

console.log(a[0], b[0]) // 5, 5

```

### let, const
var  이제 놉.  
변수는 let. 상수 const를 사용한다.  
이전 var은 중복 선언이 가능하며 function-level scope를 가졌으나...es5 에서도?  
es6에서는 let, const 는 block-level scope를 가진다.  

#### let
##### block-level scope
```js
let a = 11;
{
  let a = 22;
  let b = 33;
}

console.log(a);  //11
console.log(b);  // not defined
```
{} 내부에서 발생한 let a, let b는 외부의 console 에서 절대 찾을수 없으며 b 정의 되지 않은 변수로 에러를 발생시킨다.


##### 변수 중복 선언 불가
이전 var 로 중복선언 가능
```js
var a = 1;
var a = 111;

console.log(a); // 111
```
let으로 중복선언 시 오류 발생
```js
let a = 1;
let a = 111;

console.log(a);  // 에러
```

##### 호이스팅 불가
변수 선언전에 호출을 하면 변수가 상당에서 선언된것처럼 이동되는것을 호이스팅이라고 한다.
```js
console.log(a);
var a = 1;  // undefined
```
```js
console.log(a);
let a =1; // not defined
```
let 의 경우 에러를 발생시킨다
#### const
상수다.
##### block-level scope

  let과 동일하게 블럭단위로.
```js
{
  const a = 11;
  console.log(a);
}
console.log(a);
```
##### 재할당 불가능
```js
let a = 11;
a = 22;
console.log(a);

const b = 33;
b = 44;
console.log(b);
```
##### 객체의 내용 변경 가능
객체를 선언 후 객체 속성은 변경이 가능
```js
const a = {
    name : 'kim',
    info : {
      num : 333
    }
  };
  a.name = 'test';
  a.info.num = 444;
  
  console.log(a.name, a.info.num);
```
##### 가독성, 유지보수를 위해 사용
let 과 const 를 사용함으로서 선언할때 부터 이 상수와 변수의 의미를 파악할 있다

```js
if (x > 3){
  // do~
}

const maxnum = 3;
if (x `~`
}

```

## 오브젝트(Objects)
- 오브젝트를 선언할때는 리터럴 구문을 사용하자

```js
const a = new Object(); // 이전
const b = {}; // es6
```
 - 브라우저상의 스크립트로 실행될때 예약어를 *키*로 이용하지말자.  (ie8에서 작동하지 않는다. 다만 es6 모듈안, 서버사이드에서는 이용가능)
 ```js
 const a = {
   default: { b: 'c'},
   private: true,
 }
// 위는 키를 예약어로 사용하였다

const b = {
  defaults: {e: 'f'},
  hidden: true,
}
```
 - 예약어 대신 알기쉬운 동의어를 사용
```js
const a = {
  class: 'text',
}
const b = {
  klass: 'text'
}
const c = {
  txt: 'test' // good
}
 ```
 - 메소드 단축 구문을 사용하라
```js
const a = {
  b: function (x) {
    return x
  }
}
// 위구문은 아래처럼 사용
const c = {
  d(x) {
    return x;
  }
}

```
 - 프로퍼티의 단축구문을 이용하자
```js
const a_val = 'test';

const b = {
  a_val:  a_val,
}
// 아래 방법을 사용하자
const c = {
  a_val,
}
```
 - 프로퍼티의 단축구문은 오브젝트 선언의 시작부분에 그룹화하자

```js
const anakinSkywalker = 'Anakin Skywalker';
const lukeSkywalker = 'Luke Skywalker';

// bad
const obj = {
  episodeOne: 1,
  twoJediWalkIntoACantina: 2,
  lukeSkywalker,
  episodeThree: 3,
  mayTheFourth: 4,
  anakinSkywalker,
};

// good
const obj = {
  lukeSkywalker,
  anakinSkywalker,
  episodeOne: 1,
  twoJediWalkIntoACantina: 2,
  episodeThree: 3,
  mayTheFourth: 4,
};
```





## 배열(Arrays)
  전개 연산자 아래 주소로 작성할것  
  https://www.slideshare.net/janghyunhan/es6-75043772  
  15 페이지
## 구조화대입(Destructuring)
## 문자열(Strings)
### Template String
```js
const name = 'abc'
console.log('name is ' + name); // 이전
console.log('name is #{name}'); // es6
```
## Arrow함수(Arrow Functions)
함수 선언 방식이 변경
```js
function () {} // 이전
() => {} // ES6
```

한줄로 표현 될 경우 { } 는 생략 될 수 있다
```js
function (x) {
  return x * x;
}
// 아래처럼 변경가능
x => x * x

// 인자를 감싸는 괄호가 사라지는 이유는 아래를 보자
```
### argument
인자가1개면 괄호 생략 가능
인자가 없으면 괄호 생략 불가
```js
const log = text => {
  console.log(test);
}
log('1111');

const log2 = () => {
  console.log('2222');
}
log2();
```
### this
  https://code.i-harness.com/ko/q/ffb9e   

## Classes & Constructors
### 객체화
https://medium.com/@bluesh55/javascript-prototype-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0-f8e67c286b67  
http://insanehong.kr/post/javascript-prototype/  
https://poiemaweb.com/js-object-oriented-programming


### Class


## 모듈(Modules)
어플리케이션을 구성하는 개별적 요소 (개별 파일)를 모듈이라함.  
기능별로 쪼개져 있어 필요시 불러 사용할수 있음  
es6 에서 추가 되었으나 많은 브라우저가 미지원상태라 babel, typescript 를 사용해 es5 로 변환하여 사용해야함

### export
만들어진 모듈을 내보내어 다른 파일이나 필요한곳에서 쓸수 있도록 한다.
```js
export const random = Math.random();

export function double(x) {
  return 2 * x;
}
```
위 처럼 앞에 export 를 사용해 한개씩 내보낼수 있다

```js
//num.js 파일 내부라 가정해보자
const random = Math.random();
function double(x) {
  return 2 * x;
}

export {random, double};
```
한번에 여러개를 내보낼수도 있다

### import
내보내진 모듈을 받아오는 방법
```js
// main.js 로서 num.js 와는 별개의 파일이다
import {random, double} from './num.js'
```
from 뒤에는 어느 파일에서 불러 올것인지 지정함으로 명확하게 할수 있다.
변수명은 중복될수 있으니까.


```js
import * as num from './num.js'
```
만약 모듈의 명칭을 바꿀 필요가 있다면 아래와 같이 하자

```js
import {random as ran, double as db} from './num.js';
```
## 이터레이터와 제너레이터(Iterators and Generators)

forEach
  map
  https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/map
  reduce
    https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce
every
some
filter


const numbers = [1, 2, 3, 4, 5];
const sum = numbers.reduce(testfn(total, num), 0);
const testfn = (total, num) => {
  console.log(total, num);
  total + num;
}


const numbers = [1, 2, 3, 4, 5];
const sum = numbers.reduce((total, num) => total + num, 15);


https://medium.com/@hongkevin/js-3-%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8-%EB%B0%B0%EC%97%B4-%EB%A9%94%EC%84%9C%EB%93%9C-reduce-100-%ED%99%9C%EC%9A%A9%EB%B2%95-feat-egghead-io-97c679857ece
https://gamecodingschool.org/2015/06/16/javascript-reduce-%ED%95%A8%EC%88%98/


## 프로퍼티(Properties)
프로퍼티에 접근할때는 . 을 사용
```js
const A = {
  b: true,
  c: '111',
};

console.log(A.b);
```

변수를 통해서 프로퍼티에 억세스 하는 경우는 대괄호를 사용 []

```js
const A = {
  b: true,
  c: '111',
};

function getProp(prop){
  return A[prop]
};

const T = getProp('b');
```
### . Extended Parameter Handling
## 변수(Variables)
## Hoisting
## 조건식과 등가식(Comparison Operators & Equality)
## 블록(Blocks)
## 코멘트(Comments)
## 공백(Whitespace)
## 콤마(Commas)
## 세미콜론(Semicolons)
## 형변환과 강제(Type Casting & Coercion)
## 명명규칙(Naming Conventions)
## 이벤트(Events)
## 억세서(Accessors)
## 클로저
https://jae-kwang.github.io/blog/2017/11/13/js-closure/
## 오버로딩, 오버라이딩
https://www.zerocho.com/category/JavaScript/post/59c17a58f40d2800197c65d6
### 유효범위 (Scope)
### 어휘적 유효 범위 (Lexical Scope)
### 실행 컨텍스터 (Execution Context)
### 유효 범위 체인 (Scope chain)
### 다시한번 클로저
### 주의해야할점


## 객체지향 프로그래밍 (Object-Oriented Programming) 개요
객체지향 프로그래밍은 실세계에 존재하고 인지하는 객체(Object)를 소프트웨어의 세계에서 표현하기 위해  객체의 핵심적인 기능 또는 개념만을 추출하는 추상화를 통해 모델링하려는 프로그래밍 [패러다임][1] 이다.  
다시 말해  우리가 주변 사물을 인식하는 방식을 프로그래밍에 접목하려는 사상을 말한다.
ñn
객체 지향 프로그래밍은 하수들의 집합 또는 단순 컴퓨터 명령어의 나열이라는  전통적인 절차지향 프로그래밍 과는 다른, 관계성이 있는 객체들의 집합이라는 관점으로 접근하는 소프트웨어 디자인으로 볼 수 있다.

난 위 문구를 수십번 읽고 이해했다. 응  이 똥멍청이가 했으니 다른사람들도 할수 있다. 

장점?  유연성, 쉬운 유지보수, 확장성... 해보지 않았으니 이것도 그냥 써있는대로..



---


그룹 링크 모음

https://firejune.com/1794/Airbnb%EC%9D%98+ES6+%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8+%EC%8A%A4%ED%83%80%EC%9D%BC+%EA%B0%80%EC%9D%B4%EB%93%9C  
http://takeuu.tistory.com/91?category=737612  
https://github.com/tipjs/javascript-style-guide#%EC%B0%B8%EC%A1%B0references  
https://www.slideshare.net/janghyunhan/es6-75043772  
http://firejune.com/1713/%EC%84%B9%EC%8B%9C%ED%95%9C+%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8+%EC%BD%94%EB%94%A9+%EC%BB%A8%EB%B2%A4%EC%85%98  
https://jae-kwang.github.io/blog/2017/11/13/js-closure/  
https://medium.com/@bluesh55/javascript-prototype-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0-f8e67c286b67   
https://poiemaweb.com/js-object-oriented-programming  


https://www.slideshare.net/janghyunhan/es6-75043772

https://firejune.com/1794/Airbnb%EC%9D%98+ES6+%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8+%EC%8A%A4%ED%83%80%EC%9D%BC+%EA%B0%80%EC%9D%B4%EB%93%9C  
https://github.com/tipjs/javascript-style-guide#%EB%AA%A9%EC%B0%A8

[1]: https://www.google.co.kr/search?q=%ED%8C%A8%EB%9F%AC%EB%8B%A4%EC%9E%84%EC%9D%B4%EB%9E%80&oq=%ED%8C%A8%EB%9F%AC%EB%8B%A4%EC%9E%84%EC%9D%B4%EB%9E%80&aqs=chrome..69i57.3477j0j7&sourceid=chrome&ie=UTF-8 '한 시대의 사람들의 견해나 사고를 근본적으로 규정하고 있는 인식의 체계'