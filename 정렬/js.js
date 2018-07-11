
const arr1 = [33,5,76,1,7,17,23,29,8,9,2];

const arr_sort = {

    end_array: [],
    set_arr: (index, arr) => {
        end_array.push(arr[index]);
    }, 
    mov_arr: (index, val, arr) => {
        console.log('mov_arr', index, val, arr)
        // 여기서부터 다시해야 한다
        // 그래서 end_array 만들었다
    },
    map_move: (val, index, arr) => {
        let min_index = 0;
        let tmp_arr = arr.map((val, index, arr) => {
            if ( arr[min_index] > val ) {
                console.log( arr[min_index], ' > ', val, 'true')
                arr_sort.mov_arr(min_index, arr[min_index], arr);
                min_index = index;
            } else {
                console.log( arr[min_index], ' > ', val, 'false')
            }
        });
    },
    map_exe: () => {
        let tmp_arr = arr1.map((val, index, arr) => {
            return arr_sort.map_move(val, index, arr);
        });
        return tmp_arr;
    },
    run: (arr) => {
        
        return arr_sort.map_exe();
    }
}


console.log(arr_sort.run(arr1));


// 중도 포기
//  남은 영역 
// arr 을 인수로 주고 받고 있는대 마지막에 비교하여 자리를 교환한다해도 인수로 주고 받기에 교환해도 리셋된다
// 그래서 run:  에서 받은 배열을  변수에 담는것이 어떤가 싶은대 전체 구조가 바뀔수도 있고
// 지금으로서는 집중력이 0 이라 패스해야 겠다
// 나중에 보자