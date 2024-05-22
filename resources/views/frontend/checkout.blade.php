@extends('frontend.layouts.app')
@section('title','Checkout')
@section('content')
     <!-- breadcrumb-area -->
     <div class="breadcrumb-area-two">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item"><a href="index.html">Product</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb-area-end -->

    <div class="container pt-80 pb-80">
        <h3>Product Info</h3>
        <form action="" method="post">
        @csrf

            <div class="row mt-4">
                <div class="col-md-8">
                    <div class="card mb-4">
                        <div class="card-body">
                            <table class="table m-0">
                                <tbody>
                                    @php
                                    $subtotal = 0;
                                    $delivery_charges = 150;
                                    @endphp
                                    @foreach ($products as $item)
                                    <tr>
                                    @php
                                        $vendor = \App\Models\Vendor::where('id',$item->product->vendor_id)->first();
                                        $subtotal += $item->sub_total;
                                    @endphp
                                        <td class="d-flex gap-3">
                                            <div>
                                            <img src="{{ asset('product_image').'/'.$item->product->image }}" alt="{{$item->product->title}}" height="70px" width="auto">
                                            </div>
                                            <div>
                                                <h5 class="m-0 text-dark fw-bold">{{$item->product->title}}</h5>
                                                <p class="text-muted fs-13">Brand Name : {{ $vendor->name }} , Color : {{ $item->color }}</p>
                                            </div>
                                        </td>
                                        <td>
                                            <h5>Rs {{ $item->product->actual_price }}</h5>
                                            @if($item->product->discount > 0)
                                            <strike>{{ $item->product->price }}</strike>
                                            @endif
                                        </td>
                                        <td>{{ $item->quantity }}</td>
                                    @endforeach
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <h3>Personal Information</h3>
                    <div class="card mt-4">
                        <div class="card-body">
                            
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="">First Name</label>
                                            <input type="text" name="first_name" class="form-control" placeholder="First Name">
                                            @error('first_name')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="">Last Name</label>
                                            <input type="text" name="last_name" class="form-control" placeholder="Last Name">
                                            @error('last_name')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="">Email</label>
                                            <input type="email" name="email" class="form-control" placeholder="Email">
                                            @error('email')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="">Phone</label>
                                            <input type="number" name="phone" class="form-control" placeholder="Phone Number">
                                            @error('phone')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="">Country</label>
                                            <select name="country" class="form-select">
                                                <option value="pakistan" selected>Pakistan</option>
                                            </select>
                                            @error('country')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="">City</label>
                                            <select name="city" class="form-select">
                                                <option value="karachi" selected>Karachi</option>
                                            </select>
                                            @error('city')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="">State</label>
                                            <select name="state" class="form-select">
                                                <option value="Sindh" selected>Sindh</option>
                                            </select>
                                            @error('state')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="mb-3">
                                            <label for="">Address</label>
                                            <input type="text" name="address" class="form-control" placeholder="Address">
                                            @error('address')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="">Zip Code</label>
                                            <input type="text" name="zip_code" class="form-control"  placeholder="Zipcode">
                                            @error('zip_code')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="">Select Payment Method</label>
                                            <select name="payment_method" class="form-select" >
                                                <option value="Cash on Delivery">Cash on Delivery</option>
                                            </select>
                                            @error('payment_method')
                                                <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    
                                        
                                </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="mb-5">Billing Details</h4>
                            <div class="d-flex justify-content-between mb-2">
                                <div><h6>Sub Total : </h6></div>
                                <div><h6 class="text-muted">RS : {{$subtotal ?? 0}}</h6></div>
                            </div>
                            <div class="d-flex justify-content-between mb-2">
                                <div><h6>Delivery Charges : </h6></div>
                                <div><h6 class="text-muted">RS : {{ $delivery_charges ?? 0 }}</h6></div>
                            </div>
                            @php
                                $total = $subtotal + $delivery_charges ;
                            @endphp
                            <input type="hidden" name="total" value="{{ $total }}">
                            <input type="hidden" name="delivery_charges" value="{{ $delivery_charges }}">
                            <div class="d-flex justify-content-between mb-2">
                                <div><h6>Total : </h6></div>
                                <div><h6 class="text-muted">RS : {{ $total ?? 0  }}</h6></div>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Place Order</button>
                        </div>
                    </div>
                </div>
            </div>
            
        </form>
    </div>
@endsection