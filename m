Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0C47602AFD
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Oct 2022 14:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiJRMA5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Oct 2022 08:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbiJRL7q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Oct 2022 07:59:46 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC81BE2FC;
        Tue, 18 Oct 2022 04:59:00 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6655833E03;
        Tue, 18 Oct 2022 11:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1666094339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QDUtxZ0a1OGbbKjmUt2YBLLyxB2BEMec7Yto9aWFOqc=;
        b=Y1npQ1gDBrhfz2J2MB02d4lnN6DAmIPAO6XEwytwQ+NLQS6W6Z+zl0Pg1nUNJocMWaVV6/
        CNaBEbqsBpGmbTE4vqW114CtkJiy655L7ddto6NEquX7d9SYybjFxqqivBaoD/MT9DTdZM
        cT56r4UEsvqqh059IW2dhzaT+laovHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1666094339;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QDUtxZ0a1OGbbKjmUt2YBLLyxB2BEMec7Yto9aWFOqc=;
        b=STfqF8hGKpHpODl0T7mjfRGNdRjvF9F3Xyw7C5zBvY+TOTgpF//9Q+Do+Ik3jizxwfLKPK
        aBOMqdrK0y0Xk9Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D2A613480;
        Tue, 18 Oct 2022 11:58:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id vC8jCgOVTmMDYgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 18 Oct 2022 11:58:59 +0000
Message-ID: <ea6c20a6-f171-4618-1763-45d4efa907c9@suse.de>
Date:   Tue, 18 Oct 2022 13:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 4/7] drm/simpledrm: Add support for system memory
 framebuffers
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-5-thierry.reding@gmail.com>
 <dd869713-6eb2-fadd-fdef-6ca155198a8c@suse.de> <Y01sunkDsQQQhXuC@orome>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y01sunkDsQQQhXuC@orome>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YOa1qJJRF8BAQ1njsEirYALn"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YOa1qJJRF8BAQ1njsEirYALn
Content-Type: multipart/mixed; boundary="------------twNyfiaLtHWPToPy3is4eWpJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jon Hunter <jonathanh@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
Message-ID: <ea6c20a6-f171-4618-1763-45d4efa907c9@suse.de>
Subject: Re: [PATCH v2 4/7] drm/simpledrm: Add support for system memory
 framebuffers
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-5-thierry.reding@gmail.com>
 <dd869713-6eb2-fadd-fdef-6ca155198a8c@suse.de> <Y01sunkDsQQQhXuC@orome>
In-Reply-To: <Y01sunkDsQQQhXuC@orome>

--------------twNyfiaLtHWPToPy3is4eWpJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgVGhpZXJyeQ0KDQpBbSAxNy4xMC4yMiB1bSAxNjo1NCBzY2hyaWViIFRoaWVycnkgUmVk
aW5nOg0KPiBPbiBNb24sIE9jdCAxMCwgMjAyMiBhdCAxMDoxMjozNEFNICswMjAwLCBUaG9t
YXMgWmltbWVybWFubiB3cm90ZToNClsuLi5dDQo+Pg0KPj4gVGhhdCB3aG9sZSAnTWVtb3J5
IE1hbmFuZ2VtZW50JyBibG9jayBpcyB3aWxsIGJlIHVubWFpbnRhaW5hYmxlLiBCZWZvcmUg
SSBnbw0KPj4gaW50byBhIGRldGFpbGVkIHJldmlldywgcGxlYXNlIHNlZSBteSBxdWVzdGlv
bnMgYWJvdXQgdGhlIHJlc2VydmVkbWVtIGNvZGUNCj4+IGF0IHRoZSBlbmQgb2YgdGhlIHBh
dGNoLg0KPiANCj4gSXQgbG9va3MgcmVhc29uYWJseSBtYWludGFpbmFibGUgdG8gbWUuIEdp
dmVuIHRoYXQgd2Ugb25seSBoYXZlIF9faW9tZW0NCj4gYW5kIG5vbi1fX2lvbWVtIGNhc2Vz
LCB0aGlzIGlzIGFib3V0IHRoZSBleHRlbnQgb2YgdGhlIGNvbXBsZXhpdHkgdGhhdA0KPiBj
b3VsZCBldmVyIGJlIGFkZGVkLg0KDQpJIHRoaW5rIHdlIHNob3VsZCBzcGxpdCB0aGUgZGV0
ZWN0aW9uIGFuZCB1c2FnZSwgYXMgdGhlIGRyaXZlciBkb2VzIHdpdGggDQpvdGhlciBwcm9w
ZXJ0aWVzLiBJdCB3b3VsZCBmaXQgYmV0dGVyIGludG8gdGhlIGRyaXZlcidzIG92ZXJhbGwg
ZGVzaWduLiANCkknbGwgc2VuZCBvdXQgYW5vdGhlciBlbWFpbCB3aXRoIGEgcmV2aWV3IHRv
IGlsbHVzdHJhdGUgd2hhdCBJIGhhdmUgaW4gbWluZC4NCg0KPiANCj4+DQo+Pj4gICAgLyoN
Cj4+PiAgICAgKiBNb2Rlc2V0dGluZw0KPj4+ICAgICAqLw0KPj4+IEBAIC00OTEsMTUgKzU5
NCwxNSBAQCBzdGF0aWMgdm9pZCBzaW1wbGVkcm1fcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRv
bWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZQ0KPj4+ICAgIAlkcm1fYXRvbWlj
X2hlbHBlcl9kYW1hZ2VfaXRlcl9pbml0KCZpdGVyLCBvbGRfcGxhbmVfc3RhdGUsIHBsYW5l
X3N0YXRlKTsNCj4+PiAgICAJZHJtX2F0b21pY19mb3JfZWFjaF9wbGFuZV9kYW1hZ2UoJml0
ZXIsICZkYW1hZ2UpIHsNCj4+PiAtCQlzdHJ1Y3QgaW9zeXNfbWFwIGRzdCA9IElPU1lTX01B
UF9JTklUX1ZBRERSKHNkZXYtPnNjcmVlbl9iYXNlKTsNCj4+PiAgICAJCXN0cnVjdCBkcm1f
cmVjdCBkc3RfY2xpcCA9IHBsYW5lX3N0YXRlLT5kc3Q7DQo+Pj4gICAgCQlpZiAoIWRybV9y
ZWN0X2ludGVyc2VjdCgmZHN0X2NsaXAsICZkYW1hZ2UpKQ0KPj4+ICAgIAkJCWNvbnRpbnVl
Ow0KPj4+IC0JCWlvc3lzX21hcF9pbmNyKCZkc3QsIGRybV9mYl9jbGlwX29mZnNldChzZGV2
LT5waXRjaCwgc2Rldi0+Zm9ybWF0LCAmZHN0X2NsaXApKTsNCj4+PiAtCQlkcm1fZmJfYmxp
dCgmZHN0LCAmc2Rldi0+cGl0Y2gsIHNkZXYtPmZvcm1hdC0+Zm9ybWF0LCBzaGFkb3dfcGxh
bmVfc3RhdGUtPmRhdGEsIGZiLA0KPj4+IC0JCQkgICAgJmRhbWFnZSk7DQo+Pj4gKwkJaW9z
eXNfbWFwX2luY3IoJnNkZXYtPnNjcmVlbl9iYXNlLCBkcm1fZmJfY2xpcF9vZmZzZXQoc2Rl
di0+cGl0Y2gsIHNkZXYtPmZvcm1hdCwNCj4+PiArCQkJCQkJCQkgICAgICAmZHN0X2NsaXAp
KTsNCj4+DQo+PiBZb3UnbGwgbW9kaWZ5IHNjcmVlbl9iYXNlIGFuZCBpdCdsbCBldmVudHVh
bGx5IGJsb3cgdXAuIFlvdSBoYXZlIHRvIGtlZXANCj4+IGluaXRpYWxpemluZyB0aGUgZHN0
IHZhcmlhYmxlIHdpdGhpbiB0aGUgbG9vcC4NCj4+DQo+Pj4gKwkJZHJtX2ZiX2JsaXQoJnNk
ZXYtPnNjcmVlbl9iYXNlLCAmc2Rldi0+cGl0Y2gsIHNkZXYtPmZvcm1hdC0+Zm9ybWF0LA0K
Pj4+ICsJCQkgICAgc2hhZG93X3BsYW5lX3N0YXRlLT5kYXRhLCBmYiwgJmRhbWFnZSk7DQo+
Pj4gICAgCX0NCj4+PiAgICAJZHJtX2Rldl9leGl0KGlkeCk7DQo+Pj4gQEAgLTUxOCw3ICs2
MjEsNyBAQCBzdGF0aWMgdm9pZCBzaW1wbGVkcm1fcHJpbWFyeV9wbGFuZV9oZWxwZXJfYXRv
bWljX2Rpc2FibGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbg0KPj4+ICAgIAkJcmV0dXJuOw0K
Pj4+ICAgIAkvKiBDbGVhciBzY3JlZW4gdG8gYmxhY2sgaWYgZGlzYWJsZWQgKi8NCj4+PiAt
CW1lbXNldF9pbyhzZGV2LT5zY3JlZW5fYmFzZSwgMCwgc2Rldi0+cGl0Y2ggKiBzZGV2LT5t
b2RlLnZkaXNwbGF5KTsNCj4+PiArCWlvc3lzX21hcF9tZW1zZXQoJnNkZXYtPnNjcmVlbl9i
YXNlLCAwLCAwLCBzZGV2LT5waXRjaCAqIHNkZXYtPm1vZGUudmRpc3BsYXkpOw0KPj4+ICAg
IAlkcm1fZGV2X2V4aXQoaWR4KTsNCj4+PiAgICB9DQo+Pj4gQEAgLTYzNSw4ICs3MzgsNiBA
QCBzdGF0aWMgc3RydWN0IHNpbXBsZWRybV9kZXZpY2UgKnNpbXBsZWRybV9kZXZpY2VfY3Jl
YXRlKHN0cnVjdCBkcm1fZHJpdmVyICpkcnYsDQo+Pj4gICAgCXN0cnVjdCBkcm1fZGV2aWNl
ICpkZXY7DQo+Pj4gICAgCWludCB3aWR0aCwgaGVpZ2h0LCBzdHJpZGU7DQo+Pj4gICAgCWNv
bnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmZvcm1hdDsNCj4+PiAtCXN0cnVjdCByZXNv
dXJjZSAqcmVzLCAqbWVtOw0KPj4+IC0Jdm9pZCBfX2lvbWVtICpzY3JlZW5fYmFzZTsNCj4+
PiAgICAJc3RydWN0IGRybV9wbGFuZSAqcHJpbWFyeV9wbGFuZTsNCj4+PiAgICAJc3RydWN0
IGRybV9jcnRjICpjcnRjOw0KPj4+ICAgIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7
DQo+Pj4gQEAgLTcwNiwzNSArODA3LDkgQEAgc3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2
aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LA0K
Pj4+ICAgIAlkcm1fZGJnKGRldiwgImZyYW1lYnVmZmVyIGZvcm1hdD0lcDRjYywgc2l6ZT0l
ZHglZCwgc3RyaWRlPSVkIGJ5dGVcbiIsDQo+Pj4gICAgCQkmZm9ybWF0LT5mb3JtYXQsIHdp
ZHRoLCBoZWlnaHQsIHN0cmlkZSk7DQo+Pj4gLQkvKg0KPj4+IC0JICogTWVtb3J5IG1hbmFn
ZW1lbnQNCj4+PiAtCSAqLw0KPj4+IC0NCj4+PiAtCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNv
dXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+Pj4gLQlpZiAoIXJlcykNCj4+PiAt
CQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4+PiAtDQo+Pj4gLQlyZXQgPSBkZXZtX2Fw
ZXJ0dXJlX2FjcXVpcmVfZnJvbV9maXJtd2FyZShkZXYsIHJlcy0+c3RhcnQsIHJlc291cmNl
X3NpemUocmVzKSk7DQo+Pj4gLQlpZiAocmV0KSB7DQo+Pj4gLQkJZHJtX2VycihkZXYsICJj
b3VsZCBub3QgYWNxdWlyZSBtZW1vcnkgcmFuZ2UgJXByOiBlcnJvciAlZFxuIiwgcmVzLCBy
ZXQpOw0KPj4+ICsJcmV0ID0gc2ltcGxlZHJtX2RldmljZV9pbml0X21tKHNkZXYpOw0KPj4+
ICsJaWYgKHJldCkNCj4+PiAgICAJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+Pj4gLQl9DQo+
Pj4gLQ0KPj4+IC0JbWVtID0gZGV2bV9yZXF1ZXN0X21lbV9yZWdpb24oJnBkZXYtPmRldiwg
cmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMpLCBkcnYtPm5hbWUpOw0KPj4+IC0JaWYg
KCFtZW0pIHsNCj4+PiAtCQkvKg0KPj4+IC0JCSAqIFdlIGNhbm5vdCBtYWtlIHRoaXMgZmF0
YWwuIFNvbWV0aW1lcyB0aGlzIGNvbWVzIGZyb20gbWFnaWMNCj4+PiAtCQkgKiBzcGFjZXMg
b3VyIHJlc291cmNlIGhhbmRsZXJzIHNpbXBseSBkb24ndCBrbm93IGFib3V0LiBVc2UNCj4+
PiAtCQkgKiB0aGUgSS9PLW1lbW9yeSByZXNvdXJjZSBhcy1pcyBhbmQgdHJ5IHRvIG1hcCB0
aGF0IGluc3RlYWQuDQo+Pj4gLQkJICovDQo+Pj4gLQkJZHJtX3dhcm4oZGV2LCAiY291bGQg
bm90IGFjcXVpcmUgbWVtb3J5IHJlZ2lvbiAlcHJcbiIsIHJlcyk7DQo+Pj4gLQkJbWVtID0g
cmVzOw0KPj4+IC0JfQ0KPj4+IC0NCj4+PiAtCXNjcmVlbl9iYXNlID0gZGV2bV9pb3JlbWFw
X3djKCZwZGV2LT5kZXYsIG1lbS0+c3RhcnQsIHJlc291cmNlX3NpemUobWVtKSk7DQo+Pj4g
LQlpZiAoIXNjcmVlbl9iYXNlKQ0KPj4+IC0JCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0K
Pj4+IC0Jc2Rldi0+c2NyZWVuX2Jhc2UgPSBzY3JlZW5fYmFzZTsNCj4+PiAgICAJLyoNCj4+
PiAgICAJICogTW9kZXNldHRpbmcNCj4+PiBAQCAtODc4LDUgKzk1MywzNSBAQCBzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBzaW1wbGVkcm1fcGxhdGZvcm1fZHJpdmVyID0gew0K
Pj4+ICAgIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoc2ltcGxlZHJtX3BsYXRmb3JtX2RyaXZl
cik7DQo+Pj4gK3N0YXRpYyBpbnQgc2ltcGxlX2ZyYW1lYnVmZmVyX2RldmljZV9pbml0KHN0
cnVjdCByZXNlcnZlZF9tZW0gKnJtZW0sIHN0cnVjdCBkZXZpY2UgKmRldikNCj4+PiArew0K
Pj4+ICsJc3RydWN0IHNpbXBsZWRybV9kZXZpY2UgKnNkZXYgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsNCj4+PiArDQo+Pj4gKwlzZGV2LT5zeXNtZW1fc3RhcnQgPSBybWVtLT5iYXNlOw0K
Pj4+ICsJc2Rldi0+c3lzbWVtX3NpemUgPSBybWVtLT5zaXplOw0KPj4NCj4+ICBGcm9tIHdo
YXQgSSB1bmRlcnN0YW5kLCB5b3UgdXNlIHRoZSBzeXNtZW1fIHZhcmlhYmxlcyBpbiB0aGUg
c2FtZSBjb2RlIHRoYXQNCj4+IGFsbG9jYXRlcyB0aGUgc2ltcGxlZHJtX2RldmljZSwgd2hp
Y2ggY3JlYXRlcyBhIGNoaWNrZW4tZWdnIHByb2JsZW0uIFdoZW4NCj4+IGRvZXMgdGhpcyBj
b2RlIHJ1bj8NCj4gDQo+IFRoaXMgd2lsbCBydW4gYXMgYSByZXN1bHQgb2YgdGhlIG9mX3Jl
c2VydmVkX21lbV9kZXZpY2VfaW5pdF9ieV9pZHgoKQ0KPiBjYWxsIGVhcmxpZXIuIEl0IG1p
Z2h0IGJlIHBvc3NpYmxlIHRvIHB1c2ggbW9yZSBjb2RlIGZyb20gdGhlIHN5c21lbQ0KPiBp
bml0aWFsaXphdGlvbiBjb2RlIHBhdGggYWJvdmUgaW50byB0aGlzIGZ1bmN0aW9uLiBUaGF0
IG1heSBhbHNvIG1ha2UNCj4gdGhlIHNvbWV3aGF0IGNsdW5reSBzeXNtZW1fc3RhcnQvc2l6
ZSBmaWVsZHMgdW5uZWNlc3NhcnkuDQo+IA0KPiBBbHRlcm5hdGl2ZWx5LCB3ZSBtYXkgYmUg
YWJsZSB0byBza2lwIHRoZSB3aG9sZSBSRVNFUlZFRE1FTV9PRl9ERUNMQVJFDQo+IGJpdHMg
aGVyZSBhbmQgZGlyZWN0bHkgcmVzb2x2ZSB0aGUgbWVtb3J5LXJlZ2lvbiBwcm9wZXJ0eSBh
bmQgcmVhZCBpdHMNCj4gInJlZyIgcHJvcGVydHkuIEhvd2V2ZXIgaXQgc2VlbWVkIG1vcmUg
YXBwcm9wcmlhdGUgdG8gdXNlIHRoZSBleGlzdGluZw0KPiBpbmZyYXN0cnVjdHVyZSBmb3Ig
dGhpcywgZXZlbiBpZiBpdCdzIHJhdGhlciBtaW5pbWFsLg0KDQpJIGFncmVlLiBJdCB3b3Vs
ZCBzdGlsbCBiZSBuaWNlciBpZiB0aGVyZSB3YXMgYSB2ZXJzaW9uIG9mIA0Kb2ZfcmVzZXJ2
ZWRfbWVtX2RldmljZV9pbml0X2J5X2lkeCB0aGF0IHJldHVybnMgdGhlIGluc3RhbmNlIG9m
IA0KcmVzZXJ2ZWRfbWVtIGluc3RlYWQgb2Ygc2V0dGluZyBpdCBpbiB0aGUgZGV2aWNlIHN0
cnVjdHVyZSBiZWhpbmQgb3VyIGJhY2suDQoNCj4gDQo+Pg0KPj4NCj4+PiArDQo+Pj4gKwly
ZXR1cm4gMDsNCj4+PiArfQ0KPj4+ICsNCj4+PiArc3RhdGljIHZvaWQgc2ltcGxlX2ZyYW1l
YnVmZmVyX2RldmljZV9yZWxlYXNlKHN0cnVjdCByZXNlcnZlZF9tZW0gKnJtZW0sIHN0cnVj
dCBkZXZpY2UgKmRldikNCj4+PiArew0KPj4+ICt9DQo+Pj4gKw0KPj4+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IHJlc2VydmVkX21lbV9vcHMgc2ltcGxlX2ZyYW1lYnVmZmVyX29wcyA9IHsN
Cj4+PiArCS5kZXZpY2VfaW5pdCA9IHNpbXBsZV9mcmFtZWJ1ZmZlcl9kZXZpY2VfaW5pdCwN
Cj4+PiArCS5kZXZpY2VfcmVsZWFzZSA9IHNpbXBsZV9mcmFtZWJ1ZmZlcl9kZXZpY2VfcmVs
ZWFzZSwNCj4+PiArfTsNCj4+PiArDQo+Pj4gK3N0YXRpYyBpbnQgc2ltcGxlX2ZyYW1lYnVm
ZmVyX2luaXQoc3RydWN0IHJlc2VydmVkX21lbSAqcm1lbSkNCj4+PiArew0KPj4+ICsJcHJf
aW5mbygiZnJhbWVidWZmZXIgbWVtb3J5IGF0ICVwYSwgc2l6ZSAlbHUgYnl0ZXNcbiIsICZy
bWVtLT5iYXNlLA0KPj4+ICsJCSh1bnNpZ25lZCBsb25nKXJtZW0tPnNpemUpOw0KPj4+ICsN
Cj4+PiArCXJtZW0tPm9wcyA9ICZzaW1wbGVfZnJhbWVidWZmZXJfb3BzOw0KPj4+ICsNCj4+
PiArCXJldHVybiAwOw0KPj4+ICt9DQo+Pj4gK1JFU0VSVkVETUVNX09GX0RFQ0xBUkUoc2lt
cGxlX2ZyYW1lYnVmZmVyLCAiZnJhbWVidWZmZXIiLCBzaW1wbGVfZnJhbWVidWZmZXJfaW5p
dCk7DQo+Pg0KPj4gV2hhdCdzIHRoZSBwcnVwb3NlIG9mIHRoZXNlIGNvZGUgYXQgYWxsPyAg
SSBsb29rZWQgdGhyb3VnaCB0aGUga2VybmVsLCBidXQNCj4+IHRoZXJlIGFyZW4ndCBtYW55
IG90aGVyIGV4YW1wbGVzIG9mIGl0Lg0KPiANCj4gVGhpcyBpcyBhIGZhaXJseSBzdGFuZGFy
ZCBjb25zdHJ1Y3QgdG8gZGVhbCB3aXRoIGVhcmx5IG1lbW9yeQ0KPiByZXNlcnZhdGlvbnMu
IFdoYXQgaGFwcGVucyBpcyByb3VnaGx5IHRoaXM6IGR1cmluZyBlYXJseSBrZXJuZWwgYm9v
dCwNCj4gdGhlIHJlc2VydmVkLW1lbW9yeSBjb3JlIGNvZGUgd2lsbCBpdGVyYXRlIG92ZXIg
YWxsIGNoaWxkcmVuIG9mIHRoZSB0b3AtDQo+IGxldmVsIHJlc2VydmVkLW1lbW9yeSBub2Rl
IGFuZCBzZWUgaWYgdGhleSBoYXZlIGEgY29tcGF0aWJsZSBzdHJpbmcgdGhhdA0KPiBtYXRj
aGVzIG9uZSBvZiB0aGUgZW50cmllcyBpbiB0aGUgdGFibGUgY3JlYXRlZCBieSB0aGVzZQ0K
PiBSRVNFUlZFRE1FTV9PRl9ERUNMQVJFIGVudHJpZXMuIEl0IHdpbGwgdGhlbiBjYWxsIHRo
ZSBpbml0IGZ1bmN0aW9uIGZvcg0KPiBhIG1hdGNoZWQgZW50cnkgYW5kIHJlZ2lzdGVyIGEg
c3RydWN0IHJlc2VydmVkX21lbSBmb3IgdGhlc2UuIFRoZSBpbml0DQo+IGZ1bmN0aW9uIGlu
IHRoaXMgY2FzZSBqdXN0IGR1bXBzIGFuIGluZm9ybWF0aW9uYWwgbWVzc2FnZSB0byB0aGUg
Ym9vdA0KPiBsb2cgdG8gcHJvdmlkZSBzb21lIGluZm9ybWF0aW9uIGFib3V0IHRoZSBmcmFt
ZWJ1ZmZlciByZWdpb24gdGhhdCB3YXMNCj4gcmVzZXJ2ZWQgKHdoaWNoIGNhbiBiZSB1c2Vk
IGZvciBleGFtcGxlIGZvciB0cm91Ymxlc2hvb3RpbmcgcHVycG9zZXMpDQo+IGFuZCBzZXRz
IHRoZSBkZXZpY2UgaW5pdC9yZWxlYXNlIG9wZXJhdGlvbnMgKHdoaWNoIHdpbGwgYmUgY2Fs
bGVkIHdoZW4gYQ0KPiBkZXZpY2UgaXMgYXNzb2NpYXRlZCB3aXRoIHRoZSByZXNlcnZlZCBt
ZW1vcnkgcmVnaW9uLCBpLmUuIHdoZW4gdGhlDQo+IG9mX3Jlc2VydmVkX21lbV9kZXZpY2Vf
aW5pdF9ieV9pZHgoKSBmdW5jdGlvbiBpcyBjYWxsZWQpLg0KPiANCj4gVGhlIHJlYXNvbiB3
aHkgdGhlcmUgYXJlbid0IG1hbnkgZXhhbXBsZXMgb2YgdGhpcyBpcyBiZWNhdXNlIHRoZXNl
IGFyZQ0KPiBzcGVjaWFsIG1lbW9yeSByZWdpb25zIHRoYXQgKGF0IGxlYXN0IHVwc3RyZWFt
KSBrZXJuZWxzIHNlbGRvbSBzdXBwb3J0Lg0KPiBQZXJoYXBzIHRoZSBtb3N0IGNvbW1vbiB1
c2UtY2FzZXMgYXJlIHRoZSBzaGFyZWQgRE1BIHBvb2xzIChzdWNoIGFzDQo+IENNQSkuDQoN
ClRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0K
DQo+IA0KPiBUaGllcnJ5DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------twNyfiaLtHWPToPy3is4eWpJ--

--------------YOa1qJJRF8BAQ1njsEirYALn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNOlP0FAwAAAAAACgkQlh/E3EQov+Bv
8Q/9GPz59gZDH+wreogluTmI8lzOW4IgXjrR/R2bVua9KsiA1HfEEEjvDW2kb21MFrM+U0U10hzM
rNfgJLeDJPhx0UKe28JSZh38m7TwaYG40hZ1IB4npLKrWarlc5OXCNQFMG/GoU+3AJ3MXXTAR7P6
UITfprAr0TgqlJXk9WKWAlfqr63zb8cl0B6ZjNVfzvWwEjDd60jHyVcxB7d3Aur3G75LusYhhSRV
GyMhRd8i7w9XcWj/oqooaVqgGFddKUrZHgo7P+ThU+LVnWPbvACirXJvFdtJTJ8p5aVzP4I/D0Oy
1fqTsdnIMuvK7ouMOY1NYAfooaHNNNGwHc2S83wowPCnQf4LDZLiyXMT+rQTZ/Xnp3uCHjyAueah
JoBeaPKbUKWsDPyVeijb1C9/1ELi5YKXXxX12pb0PupOu/BW/54mR6MAZq8QxRHLxNc5f2TrKFqT
Mhnr0wrim5TJe7yGRS8sYnUTd/0o2KifZJpQe4F/D0q9h2Imj/A9ytkrVdQzf1qxF06UGcUmx3bP
Tr6Q4HtvoHLTo9tHocy7fTPCdpV69pyQSBB3Fukqj28tyTzyQY6Q6Bazuwz01oOYD0DXQOHxaTzQ
yXxUdOwXj35vhhw8LNR9W19odixeOyvZh2XIU97LyA7uMmP/L2yf6F/BM0Nbg6HsN48IfNXVbXcb
tUQ=
=LYSM
-----END PGP SIGNATURE-----

--------------YOa1qJJRF8BAQ1njsEirYALn--
