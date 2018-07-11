const sol = (s) => {
    let answer = '',
    let num = s.length % 2;
    
    if( num ) {
        console.log('홀수');
        answer = s[Math.ceil(s.length / 2 ) - 1]
    } else {
        console.log('짝수');
        answer = s[Math.ceil(s.length / 2 ) -1] + s[Math.ceil(s.length / 2 )];
    }
    return answer;
}


console.log(sol('ㅇㄹㅓㅏㅓㅣㄴㅇ라ㅓㅣㅇㄴㅁㄹㅁs'));

