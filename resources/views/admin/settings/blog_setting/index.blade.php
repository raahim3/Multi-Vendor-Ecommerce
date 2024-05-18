@extends('admin.layouts.app')
@section('title')
    Blog Setting
@endsection
@section('admin_content')
  <div class="container-fluid py-4">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header pb-0">
            <div class="d-flex align-items-center">
              <p class="mb-0">Blog Setting</p>
            </div>
          </div>
          <div class="card-body">
            <form action="{{ route('admin.settings.blog_settings.post') }}" method="POST" enctype="multipart/form-data">
                @csrf
            <div class="row">
              <div class="col-md-6 mb-3">
                <div class="form-group d-flex justify-content-between align-items-center">
                  <p class="m-0">Comment Approval System</p>
                  <div class="d-flex comment_approaval_main">
                    
                        <div>
                            <label for="comment_approaval_enable" class="c_app_label {{ $settings->comment_approaval == 1 ? 'active' : "" }}">Enable</label>
                            <input id="comment_approaval_enable" class="comment_approaval" hidden type="radio" value="1" name="comment_approaval" {{ $settings->comment_approaval == 1 ? 'checked' : "" }}>
                        </div>
                        <div>
                            <label for="comment_approaval_disable" class="c_app_label {{ $settings->comment_approaval == 0 ? 'active' : "" }}">Disable</label>
                            <input id="comment_approaval_disable" class="comment_approaval" hidden type="radio" {{ $settings->comment_approaval == 0 ? 'checked' : "" }} value="0" name="comment_approaval">
                        </div>
                  </div>
                  @error('site_name')
                    <span class="validated_txt">{{ $message }}</span>
                  @enderror
                </div>
              </div>
              <div class="d-flex justify-content-end">

                  <button class="btn btn-primary btn-sm" type="submit">Save</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection
@section('admin_script')
    <script>
        $(document).on('change','.comment_approaval',function(){
            var value = $(this).val();
            $('.c_app_label').removeClass('active');
            $(this).parent().find('.c_app_label').addClass('active');
            // $.ajax({
            //     url:"{{ route('admin.settings.blog_settings.post') }}",
            //     type:"GET",
            //     data:{value:value},
            //     success:function(response){

            //     },
            // });
        });
    </script>
@endsection
