@extends('vendor.layouts.app')
@section('title')
    Edit Product
@endsection
@section('vendor_content')
<style>
    
    .sub_images{
        position:relative;
        width:fit-content;
    }
    .sub_images_delete
    {
        position:absolute;
        top:0px;
        right:0px;
        border:none;
        background-color:transparent;
    }
</style>

  <div class="container-fluid py-4">
    <form action="{{ route('vendor.product.update',$product->id ) }}" method="POST" enctype="multipart/form-data">
      @csrf
      @method('PUT')
    <div class="row">
      <div class="col-md-8">
        <div class="card">
          <div class="card-header pb-0">
            <div class="d-flex align-items-center">
              <p class="mb-0">Edit Product</p>
            </div>
          </div>
          <div class="card-body">
           
            <div class="row">
              
              <div class="col-md-6">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Title</label>
                  <input class="form-control" type="text" value="{{$product->title}}" name="title">
                    @error('title')
                        <span class="validated_txt">{{ $message }}</span>
                    @enderror
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Price</label>
                  <input class="form-control" type="number" value="{{$product->price}}" name="price">
                  @error('price')
                    <span class="validated_txt">{{ $message }}</span>
                  @enderror
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Quantity</label>
                  <input class="form-control" type="number" value="{{$product->quantity}}" name="quantity">
                  @error('quantity')
                    <span class="validated_txt">{{ $message }}</span>
                  @enderror
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Discount (%)</label>
                  <input class="form-control" type="number" value="{{ $product->discount }}" name="discount">
                  @error('discount')
                    <span class="validated_txt">{{ $message }}</span>
                  @enderror
                </div>
              </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="example-text-input" class="form-control-label">Category</label>
                <select class="form-control" name="category_id" id="category_id" data-url="{{route('vendor.product.get_sub_categories')}}" data-sub_cate_id="{{$product->sub_category_id}}">
                    <option selected disabled>Select Category</option>
                    @foreach($categories as $category)
                        <option value="{{ $category->id }}" @if($category->id == $product->category_id ) selected @endif >{{ $category->title }}</option>
                    @endforeach
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="example-text-input" class="form-control-label">Sub Category</label>
                <select class="form-control" name="sub_category_id" id="sub_category_append">

                </select>
              </div>
            </div>
            <div class="col-md-12">
              <div class="form-group">
                <label for="example-text-input" class="form-control-label">Short Description</label>
                <textarea class="form-control" name="description">{{$product->description}}</textarea>
                  @error('description')
                      <span class="validated_txt">{{ $message }}</span>
                  @enderror
              </div>
            </div>
              <div class="col-md-12">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Overview</label>
                 <textarea class="summernote" name="content">{{ $product->content }}</textarea>
                </div>
                @error('content')
                    <span class="validated_txt">{{ $message }}</span>
                  @enderror
              </div>
              <hr class="horizontal dark">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Colors</label>
                  
                  <div class="d-flex gap-2">
                    <a class="btn btn-info btn-sm" href="javascript:void(0);" id="colorBtn"><i class="fa fa-plus"></i></a>
                  </div>
                  @foreach ($product->colors as $color)
                    <div class="d-flex gap-2 mt-2">
                      <input class="form-control" type="text" value="{{ $color->name }}" name="color_name[]">
                      <input class="form-control" type="color" value="{{ $color->color }}" name="color[]">
                      <select class="form-control" name="color_status[]">
                        <option value="1" {{ $color->status == 1 ? 'selected' : '' }}>Available</option>
                        <option value="0" {{ $color->status == 0 ? 'selected' : '' }}>Unavailable</option>
                      </select>
                      <a class="btn btn-danger btn-sm" href="javascript:void(0);" id="colorRemoveBtn"><i class="fa fa-trash"></i></a>
                    </div>
                  @endforeach
                  <div id="append_colors"></div>
                </div>
              </div>
              <hr class="horizontal dark">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Size</label>
                  <div class="d-flex gap-2">
                    
                    <a class="btn btn-info btn-sm" href="javascript:void(0);" id="sizeBtn"><i class="fa fa-plus"></i></a>
                  </div>
                  @foreach ($product->sizes as $size)
                    <div class="d-flex gap-2 mt-2">
                      <input class="form-control" type="text" value="{{ $size->size }}" name="size[]">
                      <select class="form-control" name="size_status[]">
                        <option selected disabled>Select Size Color</option>
                        <option value="1" {{ $size->status == 1 ? 'selected' : '' }}>Available</option>
                        <option value="0" {{ $size->status == 0 ? 'selected' : '' }}>Unavailable</option>
                      </select>
                      <a class="btn btn-danger btn-sm" href="javascript:void(0);" id="sizeRemoveBtn"><i class="fa fa-trash"></i></a>
                    </div>
                  @endforeach
                  <div id="append_size"></div>
                </div>
              </div>
              <hr class="horizontal dark">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Additional Information</label>
                  <div class="d-flex gap-2">
                    <a class="btn btn-info btn-sm" href="javascript:void(0);" id="addInfoBtn"><i class="fa fa-plus"></i></a>
                  </div>
                  @foreach ($product->addtional_infos as $addtional_info)
                    <div class="d-flex gap-2 mt-2">
                      <input class="form-control" type="text" value="{{ $addtional_info->key }}" name="add_info_key[]">
                      <input class="form-control" type="text" value="{{ $addtional_info->value }}" name="add_info_value[]">
                      <a class="btn btn-danger btn-sm" href="javascript:void(0);" id="addInfoRemoveBtn"><i class="fa fa-trash"></i></a>
                    </div>
                  @endforeach
                  <div id="add_info_size"></div>
                </div>
              </div>
            
          </div>
        </div>
      </div>
    </div>
      <div class="col-md-4">
        <div class="card">
          <div class="card-body">
            <div class="col-md-12">
              <div class="form-group">
                <label for="example-text-input" class="form-control-label">Main Image</label>
                <input class="form-control" type="file" name="image" data-default-file="{{ asset('product_image'.'/'.$product->image) }}">
                @error('image')
                  <span class="validated_txt">{{ $message }}</span>
                @enderror
              </div>
            </div>
            <div class="col-md-12">
              <div class="form-group">
                <label for="example-text-input" class="form-control-label">Sub Images</label>
                <input class="form-control" type="file" name="more_images[]" multiple>
                @error('more_images')
                  <span class="validated_txt">{{ $message }}</span>
                @enderror
              </div>
                <div class="row">
                    @foreach($product->images as $image)
                        <div class='sub_images'>
                            <button type="button" class="sub_images_delete" data-id="{{ $image->id }}" data-url="{{ route('vendor.product.delete_sub_cate_image') }}"><i class="fa fa-close text-danger"></i></button>
                            <img src="{{ asset('product_image'.'/'.$image->image) }}" height="100px" width="auto">
                        </div>
                    @endforeach
                </div>
            </div>
            <p class="text-uppercase text-sm">SEO INFO</p>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Meta Title</label>
                  <input class="form-control" type="text" value="{{$product->meta_title}}" name="meta_title">
                  @error('meta_title')
                    <span class="validated_txt">{{ $message }}</span>
                  @enderror
                </div>
               </div>
               <div class="col-md-12">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Meta description</label>
                  <textarea class="form-control" type="text" name="meta_description">{{$product->meta_description}}</textarea>
                  @error('meta_description')
                    <span class="validated_txt">{{ $message }}</span>
                  @enderror
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Meta Keywords</label>
                  <input class="form-control" type="text" value="{{$product->meta_keywords}}" name="meta_keywords">
                  @error('meta_keywords')
                    <span class="validated_txt">{{ $message }}</span>
                  @enderror
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                  <label for="example-text-input" class="form-control-label">Status</label>
                  <select class="form-control" name="status" required >
                      <option selected disabled>Select Status</option>
                      <option value="1" @if($product->status == 1) selected @endif>Published</option>
                      <option value="0"  @if($product->status == 0) selected @endif>Draft</option>
                  </select>
                </div>
              </div>
            </div>
            <button class="btn btn-primary btn-sm ms-auto float-end" type="submit">Update</button>
          </div>
        </div>
      </div>
      
    </div>
  </form>
  </div>
@endsection
@section('vendor_script')
    <script>
        $(document).ready(function(){
            const id = $('#category_id').val();
            const url = $('#category_id').data('url');
            const sub_cate_id = $('#category_id').data('sub_cate_id');
            
            $.ajax({
                type:"GET",
                url:url,
                data:{id:id,sub_cate_id:sub_cate_id},
                success:function(response){
                    $('#sub_category_append').html(response);
                }
            });
        });
    $(document).on('click','#colorBtn',function(){
      var html = '<div class="d-flex gap-2 mt-2">';
          html += '<input class="form-control" type="text" placeholder="Color Name" name="color_name[]">';
          html += '<input class="form-control" type="color" placeholder="Color" name="color[]">';
          html += '<select class="form-control" name="color_status[]" >';
          html += '<option selected disabled>Select Status Color</option>';
          html += '<option value="1">Available</option>';
          html += '<option value="0">Unavailable</option>';
          html += '</select>';
          html += '<a class="btn btn-danger btn-sm" href="javascript:void(0);" id="colorRemoveBtn"><i class="fa fa-trash"></i></a>';
          html += '</div>';

          $('#append_colors').append(html);
    });
    $(document).on('click','#sizeBtn',function(){
      var html = '<div class="d-flex gap-2 mt-2">';
          html += '<input class="form-control" type="text" placeholder="Size" name="size[]">';
          html += '<select class="form-control" name="size_status[]">';
          html += '<option selected disabled>Select Size Color</option>';
          html += '<option value="1">Available</option>';
          html += '<option value="0">Unavailable</option>';
          html += '</select>';
          html += '<a class="btn btn-danger btn-sm" href="javascript:void(0);" id="sizeRemoveBtn"><i class="fa fa-trash"></i></a>';
          html += '</div>';

          $('#append_size').append(html);
    });
    $(document).on('click','#addInfoBtn',function(){
      var html = '<div class="d-flex gap-2 mt-2">';
          html += '<input class="form-control" type="text" placeholder="eg:Brand Name" name="add_info_key[]">';
          html += '<input class="form-control" type="text" placeholder="eg:Iphone" name="add_info_value[]">';
          html += '<a class="btn btn-danger btn-sm" href="javascript:void(0);" id="addInfoRemoveBtn"><i class="fa fa-trash"></i></a>';
          html += '</div>';

          $('#add_info_size').append(html);
    });
    $(document).on('click','#colorRemoveBtn',function(){
      $(this).parent().remove();
    });
    $(document).on('click','#sizeRemoveBtn',function(){
      $(this).parent().remove();
    });
    $(document).on('click','#addInfoRemoveBtn',function(){
      $(this).parent().remove();
    });
    </script>
@endsection