@extends('admin.layouts.app')
@section('title', 'All Blog Comment')
@section('admin_content')
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-12">
                <div class="card mb-4">
                    <div class="card-header pb-0">
                        <div class="d-flex justify-content-between w-100">
                            <div>
                                <h6>Blog Comment Table</h6>
                            </div>
                            <div>
                                <a class="btn btn-primary btn-sm" href="{{ route('admin.blog.category.create') }}"> <i class="fa fa-plus"></i> Add Category</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body px-0 pt-0 pb-2">
                        <div class="table-responsive p-0">
                            <table class="table align-items-center mb-0">
                                <thead>
                                    <tr>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                            #</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                            Comment</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                            Blog</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                            Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $serial = 1;
                                    @endphp
                                    @foreach ($comments as $comment)
                                        <tr>
                                            <td class="p-4"><p class="text-xs font-weight-bold mb-0">{{ $serial++ }}</p></td>
                                            <td>
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">{{ $comment->comment }}</h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <a href="{{ route('blog.detail',$comment->blog->slug ) }}" wire:navigate>{{ $comment->blog->title }}</a>
                                            </td>
                                            <td class="">
                                                <button class="btn {{ $comment->status == 1 ? 'btn-primary' : 'btn-danger' }}" id="commentStatus" data-comment_id="{{ $comment->id }}">{{ $comment->status == 1 ? 'Approaved' : 'Pending' }}</button>
                                                <form action="{{ route('admin.comments.destroy' ,$comment->id) }}" method="post">
                                                @csrf
                                                @method('DELETE')
                                                <button class="btn btn-danger" type="submit">Delete</button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <div class="w-100 d-flex justify-content-end p-3">
                                <div>
                                    {{ $comments->links() }}
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@section('admin_script')

    <script>
        $(document).on('click','#commentStatus',function(){
            let comment_id = $(this).data('comment_id');
            let thisBtn = $(this);
            $.ajax({
                url:"{{ route('admin.comments.change_status') }}",
                type:"GET",
                data:{comment_id:comment_id},
                success:function(response){
                    if(response.status == 1){
                        thisBtn.removeClass('btn-danger').addClass('btn-primary').text('Approaved');
                    }else{
                        thisBtn.removeClass('btn-primary').addClass('btn-danger').text('Pending');
                    }
                }
            });
        });
    </script>
    
@endsection
@endsection
