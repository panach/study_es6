
const arr1 = [33,5,76,1,7,17,23,29,8,9,2];

const arr_sort = {

    end_array: [],
    set_arr: (index, arr) => {
        end_array.push(arr[index]);
    }, 
    mov_arr: (index, val, arr) => {
        console.log('mov_arr', index, val, arr)
        arr
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
