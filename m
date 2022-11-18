Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8493662F727
	for <lists+linux-tegra@lfdr.de>; Fri, 18 Nov 2022 15:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242314AbiKROVS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 18 Nov 2022 09:21:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242310AbiKROVR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 09:21:17 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDF2F21;
        Fri, 18 Nov 2022 06:21:16 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 56FCE22931;
        Fri, 18 Nov 2022 14:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1668781275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SY/dCkZ/3AxNSB5HUFiWr1Ix4T0gZyZITzR22GxgzLA=;
        b=IzgUZrI9v9PKfORCuxzBH8aSQf5Y8nLW6b90qqehKb7W0Yi4ZIkM4NruoyfCx0+lJjigTE
        9wEaeKn0Co/bo1KgTSyJ7c03AmtpXyhKBF/Uuz9feSBpSHHRz5Xv/9PrtBazdKEf2Li8ID
        T3UQZw5aEJVkeG9XcE1CKY7jOtMq+SI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1668781275;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SY/dCkZ/3AxNSB5HUFiWr1Ix4T0gZyZITzR22GxgzLA=;
        b=vIo3Hn74K0tCxu5KTOP7edZ01r+UARt1/BJINPS8Bc0dnNa3mb6jEbgSg8RMoAlcXNDyi2
        ZlTaT1fkI97noiDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 239441345B;
        Fri, 18 Nov 2022 14:21:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id VYGhB9uUd2M4RQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 14:21:15 +0000
Message-ID: <053fbbc2-824d-648b-fdac-6f6c7c64181d@suse.de>
Date:   Fri, 18 Nov 2022 15:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 5/8] drm/simpledrm: Add support for system memory
 framebuffers
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-6-thierry.reding@gmail.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221117184039.2291937-6-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Qwo3ITznHjDSI4DkAtiLooRb"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Qwo3ITznHjDSI4DkAtiLooRb
Content-Type: multipart/mixed; boundary="------------ndIgrHfu0c0LQqyaRHAuBwUD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Message-ID: <053fbbc2-824d-648b-fdac-6f6c7c64181d@suse.de>
Subject: Re: [PATCH v3 5/8] drm/simpledrm: Add support for system memory
 framebuffers
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-6-thierry.reding@gmail.com>
In-Reply-To: <20221117184039.2291937-6-thierry.reding@gmail.com>

--------------ndIgrHfu0c0LQqyaRHAuBwUD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMTEuMjIgdW0gMTk6NDAgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IFNpbXBs
ZSBmcmFtZWJ1ZmZlcnMgY2FuIGJlIHNldCB1cCBpbiBzeXN0ZW0gbWVtb3J5LCB3aGljaCBj
YW5ub3QgYmUNCj4gcmVxdWVzdGVkIGFuZC9vciBJL08gcmVtYXBwZWQgdXNpbmcgdGhlIEkv
TyByZXNvdXJjZSBoZWxwZXJzLiBBZGQgYQ0KPiBzZXBhcmF0ZSBjb2RlIHBhdGggdGhhdCBv
YnRhaW5zIHN5c3RlbSBtZW1vcnkgZnJhbWVidWZmZXJzIGZyb20gdGhlDQo+IHJlc2VydmVk
IG1lbW9yeSByZWdpb24gcmVmZXJlbmNlZCBpbiB0aGUgbWVtb3J5LXJlZ2lvbiBwcm9wZXJ0
eS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIHNpbXBsaWZ5IG1lbW9yeSBj
b2RlIGFuZCBtb3ZlIGJhY2sgdG8gc2ltcGxlZHJtX2RldmljZV9jcmVhdGUoKQ0KPiAtIGV4
dHJhY3Qgc2NyZWVuX2Jhc2UgaW9zeXNfbWFwIGZpeCBpbnRvIHNlcGFyYXRlIHBhdGNoDQo+
IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIG1ha2Ugc2NyZWVuIGJhc2UgYSBzdHJ1Y3QgaW9z
eXNfbWFwIHRvIGF2b2lkIHNwYXJzZSB3YXJuaW5ncw0KPiANCj4gICBkcml2ZXJzL2dwdS9k
cm0vdGlueS9zaW1wbGVkcm0uYyB8IDk5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gaW5kZXggMzY3M2E0
MmU0YmY0Li43ZjM5YmM1OGRhNTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
aW55L3NpbXBsZWRybS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRy
bS5jDQo+IEBAIC0zLDYgKzMsNyBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4g
ICAjaW5jbHVkZSA8bGludXgvb2ZfY2xrLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L21pbm1h
eC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gICAjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGF0YS9zaW1wbGVmYi5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9w
bGF0Zm9ybV9kZXZpY2UuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1
bWVyLmg+DQo+IEBAIC0xODQsNiArMTg1LDMxIEBAIHNpbXBsZWZiX2dldF9mb3JtYXRfb2Yo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpvZl9ub2RlKQ0K
PiAgIAlyZXR1cm4gc2ltcGxlZmJfZ2V0X3ZhbGlkYXRlZF9mb3JtYXQoZGV2LCBmb3JtYXQp
Ow0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBzdHJ1Y3QgcmVzb3VyY2UgKg0KPiArc2ltcGxl
ZmJfZ2V0X21lbW9yeV9vZihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm9mX25vZGUpDQo+ICt7DQo+ICsJc3RydWN0IGRldmljZV9ub2RlICpucDsNCj4g
KwlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gKwlpbnQgZXJyOw0KPiArDQo+ICsJbnAgPSBv
Zl9wYXJzZV9waGFuZGxlKG9mX25vZGUsICJtZW1vcnktcmVnaW9uIiwgMCk7DQo+ICsJaWYg
KCFucCkNCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICsNCj4gKwlyZXMgPSBkZXZtX2t6YWxsb2Mo
ZGV2LT5kZXYsIHNpemVvZigqcmVzKSwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFyZXMpDQo+
ICsJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiArDQo+ICsJZXJyID0gb2ZfYWRkcmVz
c190b19yZXNvdXJjZShucCwgMCwgcmVzKTsNCj4gKwlpZiAoZXJyKQ0KPiArCQlyZXR1cm4g
RVJSX1BUUihlcnIpOw0KPiArDQo+ICsJaWYgKG9mX2dldF9wcm9wZXJ0eShvZl9ub2RlLCAi
cmVnIiwgTlVMTCkpDQo+ICsJCWRybV93YXJuKGRldiwgInByZWZlcnJpbmcgXCJtZW1vcnkt
cmVnaW9uXCIgb3ZlciBcInJlZ1wiIHByb3BlcnR5XG4iKTsNCg0KVGhlIHJlZyBwcm9wZXJ0
eSBpcyBjb252ZXJ0ZWQgdG8gYSBkZXZpY2UgcmVzb3VyY2Ugd2hlbiB3ZSBjcmVhdGUgdGhl
IA0KZGV2aWNlIGF0IFsxXS4NCg0KSSBoYXZlIGFub3RoZXIgcXVlc3Rpb24sIHdoaWNoIEkg
d2FzIGRpc2N1c3Npbmcgd2l0aCBKYXZpZXIgcmVjZW50bHkuIElzIA0KaXQgcG9zc2libGUg
dG8gaGFuZGxlIG1lbW9yeS1yZWdpb24gdGhlcmUgYXV0b21hdGljYWxseT8gSWYsIGZvciAN
CmV4bWFwbGUsIGl0IHdvdWxkIGNyZWF0ZSBhIHJlc291cmNlIHdpdGggSU9SRVNPVVJDRV9D
QUNIRUFCTEUsIHNpbXBsZWRybSANCndvdWxkIGhhbmRsZSBpdCBhcyBtZW1vcnkgcmVnaW9u
LiBXaXRob3V0IHRoZSBDQUNIRUFCTEUgZmxhZywgaXQgd291bGQgDQpiZSBhIHJlZ3VsYXIg
cmVzb3VyY2UgYXMgYmVmb3JlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4wLjkvc291cmNlL2RyaXZlcnMv
b2YvcGxhdGZvcm0uYyNMNTg2DQoNCj4gKw0KPiArCXJldHVybiByZXM7DQo+ICt9DQo+ICsN
Cj4gICAvKg0KPiAgICAqIFNpbXBsZSBGcmFtZWJ1ZmZlciBkZXZpY2UNCj4gICAgKi8NCj4g
QEAgLTYyMyw4ICs2NDksNyBAQCBzdGF0aWMgc3RydWN0IHNpbXBsZWRybV9kZXZpY2UgKnNp
bXBsZWRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1fZHJpdmVyICpkcnYsDQo+ICAgCXN0
cnVjdCBkcm1fZGV2aWNlICpkZXY7DQo+ICAgCWludCB3aWR0aCwgaGVpZ2h0LCBzdHJpZGU7
DQo+ICAgCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmZvcm1hdDsNCj4gLQlzdHJ1
Y3QgcmVzb3VyY2UgKnJlcywgKm1lbTsNCj4gLQl2b2lkIF9faW9tZW0gKnNjcmVlbl9iYXNl
Ow0KPiArCXN0cnVjdCByZXNvdXJjZSAqcmVzLCAqbWVtID0gTlVMTDsNCj4gICAJc3RydWN0
IGRybV9wbGFuZSAqcHJpbWFyeV9wbGFuZTsNCj4gICAJc3RydWN0IGRybV9jcnRjICpjcnRj
Ow0KPiAgIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7DQo+IEBAIC02NzYsNiArNzAx
LDkgQEAgc3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzaW1wbGVkcm1fZGV2aWNl
X2NyZWF0ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LA0KPiAgIAkJZm9ybWF0ID0gc2ltcGxl
ZmJfZ2V0X2Zvcm1hdF9vZihkZXYsIG9mX25vZGUpOw0KPiAgIAkJaWYgKElTX0VSUihmb3Jt
YXQpKQ0KPiAgIAkJCXJldHVybiBFUlJfQ0FTVChmb3JtYXQpOw0KPiArCQltZW0gPSBzaW1w
bGVmYl9nZXRfbWVtb3J5X29mKGRldiwgb2Zfbm9kZSk7DQo+ICsJCWlmIChJU19FUlIobWVt
KSkNCj4gKwkJCXJldHVybiBFUlJfQ0FTVChtZW0pOw0KPiAgIAl9IGVsc2Ugew0KPiAgIAkJ
ZHJtX2VycihkZXYsICJubyBzaW1wbGVmYiBjb25maWd1cmF0aW9uIGZvdW5kXG4iKTsNCj4g
ICAJCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOw0KPiBAQCAtNjk4LDMyICs3MjYsNTUgQEAg
c3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0
ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LA0KPiAgIAkgKiBNZW1vcnkgbWFuYWdlbWVudA0K
PiAgIAkgKi8NCj4gICANCj4gLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwg
SU9SRVNPVVJDRV9NRU0sIDApOw0KPiAtCWlmICghcmVzKQ0KPiAtCQlyZXR1cm4gRVJSX1BU
UigtRUlOVkFMKTsNCj4gKwlpZiAobWVtKSB7DQo+ICsJCXZvaWQgKnNjcmVlbl9iYXNlOw0K
PiAgIA0KPiAtCXJldCA9IGRldm1fYXBlcnR1cmVfYWNxdWlyZV9mcm9tX2Zpcm13YXJlKGRl
diwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMpKTsNCj4gLQlpZiAocmV0KSB7DQo+
IC0JCWRybV9lcnIoZGV2LCAiY291bGQgbm90IGFjcXVpcmUgbWVtb3J5IHJhbmdlICVwcjog
ZXJyb3IgJWRcbiIsIHJlcywgcmV0KTsNCj4gLQkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4g
LQl9DQo+ICsJCXJldCA9IGRldm1fYXBlcnR1cmVfYWNxdWlyZV9mcm9tX2Zpcm13YXJlKGRl
diwgbWVtLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShtZW0pKTsNCj4gKwkJaWYgKHJldCkgew0K
PiArCQkJZHJtX2VycihkZXYsICJjb3VsZCBub3QgYWNxdWlyZSBtZW1vcnkgcmFuZ2UgJXBy
OiAlZFxuIiwgbWVtLCByZXQpOw0KPiArCQkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4gKwkJ
fQ0KPiAgIA0KPiAtCW1lbSA9IGRldm1fcmVxdWVzdF9tZW1fcmVnaW9uKCZwZGV2LT5kZXYs
IHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSwgZHJ2LT5uYW1lKTsNCj4gLQlpZiAo
IW1lbSkgew0KPiAtCQkvKg0KPiAtCQkgKiBXZSBjYW5ub3QgbWFrZSB0aGlzIGZhdGFsLiBT
b21ldGltZXMgdGhpcyBjb21lcyBmcm9tIG1hZ2ljDQo+IC0JCSAqIHNwYWNlcyBvdXIgcmVz
b3VyY2UgaGFuZGxlcnMgc2ltcGx5IGRvbid0IGtub3cgYWJvdXQuIFVzZQ0KPiAtCQkgKiB0
aGUgSS9PLW1lbW9yeSByZXNvdXJjZSBhcy1pcyBhbmQgdHJ5IHRvIG1hcCB0aGF0IGluc3Rl
YWQuDQo+IC0JCSAqLw0KPiAtCQlkcm1fd2FybihkZXYsICJjb3VsZCBub3QgYWNxdWlyZSBt
ZW1vcnkgcmVnaW9uICVwclxuIiwgcmVzKTsNCj4gLQkJbWVtID0gcmVzOw0KPiAtCX0NCj4g
KwkJZHJtX2luZm8oZGV2LCAidXNpbmcgc3lzdGVtIG1lbW9yeSBmcmFtZWJ1ZmZlciBhdCAl
cHJcbiIsIG1lbSk7DQo+ICAgDQo+IC0Jc2NyZWVuX2Jhc2UgPSBkZXZtX2lvcmVtYXBfd2Mo
JnBkZXYtPmRldiwgbWVtLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShtZW0pKTsNCj4gLQlpZiAo
IXNjcmVlbl9iYXNlKQ0KPiAtCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gKwkJc2Ny
ZWVuX2Jhc2UgPSBkZXZtX21lbXJlbWFwKGRldi0+ZGV2LCBtZW0tPnN0YXJ0LCByZXNvdXJj
ZV9zaXplKG1lbSksIE1FTVJFTUFQX1dCKTsNCj4gKwkJaWYgKCFzY3JlZW5fYmFzZSkNCj4g
KwkJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiArDQo+ICsJCWlvc3lzX21hcF9zZXRf
dmFkZHIoJnNkZXYtPnNjcmVlbl9iYXNlLCBzY3JlZW5fYmFzZSk7DQo+ICsJfSBlbHNlIHsN
Cj4gKwkJdm9pZCBfX2lvbWVtICpzY3JlZW5fYmFzZTsNCj4gKw0KPiArCQlyZXMgPSBwbGF0
Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOw0KPiArCQlpZiAo
IXJlcykNCj4gKwkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiAgIA0KPiAtCWlvc3lz
X21hcF9zZXRfdmFkZHJfaW9tZW0oJnNkZXYtPnNjcmVlbl9iYXNlLCBzY3JlZW5fYmFzZSk7
DQo+ICsJCXJldCA9IGRldm1fYXBlcnR1cmVfYWNxdWlyZV9mcm9tX2Zpcm13YXJlKGRldiwg
cmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMpKTsNCj4gKwkJaWYgKHJldCkgew0KPiAr
CQkJZHJtX2VycihkZXYsICJjb3VsZCBub3QgYWNxdWlyZSBtZW1vcnkgcmFuZ2UgJXByOiAl
ZFxuIiwgJnJlcywgcmV0KTsNCj4gKwkJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+ICsJCX0N
Cj4gKw0KPiArCQlkcm1faW5mbyhkZXYsICJ1c2luZyBJL08gbWVtb3J5IGZyYW1lYnVmZmVy
IGF0ICVwclxuIiwgcmVzKTsNCj4gKw0KPiArCQltZW0gPSBkZXZtX3JlcXVlc3RfbWVtX3Jl
Z2lvbigmcGRldi0+ZGV2LCByZXMtPnN0YXJ0LCByZXNvdXJjZV9zaXplKHJlcyksDQo+ICsJ
CQkJCSAgICAgIGRydi0+bmFtZSk7DQo+ICsJCWlmICghbWVtKSB7DQo+ICsJCQkvKg0KPiAr
CQkJICogV2UgY2Fubm90IG1ha2UgdGhpcyBmYXRhbC4gU29tZXRpbWVzIHRoaXMgY29tZXMg
ZnJvbSBtYWdpYw0KPiArCQkJICogc3BhY2VzIG91ciByZXNvdXJjZSBoYW5kbGVycyBzaW1w
bHkgZG9uJ3Qga25vdyBhYm91dC4gVXNlDQo+ICsJCQkgKiB0aGUgSS9PLW1lbW9yeSByZXNv
dXJjZSBhcy1pcyBhbmQgdHJ5IHRvIG1hcCB0aGF0IGluc3RlYWQuDQo+ICsJCQkgKi8NCj4g
KwkJCWRybV93YXJuKGRldiwgImNvdWxkIG5vdCBhY3F1aXJlIG1lbW9yeSByZWdpb24gJXBy
XG4iLCByZXMpOw0KPiArCQkJbWVtID0gcmVzOw0KPiArCQl9DQo+ICsNCj4gKwkJc2NyZWVu
X2Jhc2UgPSBkZXZtX2lvcmVtYXBfd2MoJnBkZXYtPmRldiwgbWVtLT5zdGFydCwgcmVzb3Vy
Y2Vfc2l6ZShtZW0pKTsNCj4gKwkJaWYgKCFzY3JlZW5fYmFzZSkNCj4gKwkJCXJldHVybiBF
UlJfUFRSKC1FTk9NRU0pOw0KPiArDQo+ICsJCWlvc3lzX21hcF9zZXRfdmFkZHJfaW9tZW0o
JnNkZXYtPnNjcmVlbl9iYXNlLCBzY3JlZW5fYmFzZSk7DQo+ICsJfQ0KPiAgIA0KPiAgIAkv
Kg0KPiAgIAkgKiBNb2Rlc2V0dGluZw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAz
NjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------ndIgrHfu0c0LQqyaRHAuBwUD--

--------------Qwo3ITznHjDSI4DkAtiLooRb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN3lNoFAwAAAAAACgkQlh/E3EQov+DJ
ew/+L7pv9NmiyfGl84DoG5nGu0Qe+3Jj9lqizo1F/Dehkgm+uw6EzRI7tzreqaHiQ60GLBzgQgb8
lMhfqRSInxdK0fmoa59ZprN3H1fCQ95o2yUmIVgCJA7iaCe00hbhcQXAqRjilsBFW2Aa9Dfp65fo
iapz8woEvw0JUAfQv+RQE9gt9UFUE4e9zKhowvIxD8vbpXF8khfCmURsVfwTAWDCdi0et/1nq/SU
N0Onj3KxIHEWLSSwnbfQTeXMOht71KBBKj3C2PaVpFyLJUYyHkNwxJUhkQMAmMnDTd7KWqXbthBO
uAg1MZa+41kA8rxtLcrE0A2tzs1pxTdjn9u3X+MpKRhlmGpj9VHbAYPIGSw6uNaYSka6vR1Wav0X
nBXNOSgFCfHwqtp03dcJaTo4Wzo4qEGySm+9FgQ+hYzf6iL9mLBHGIKKCfiz8bXvnHrj1uKWjYAk
aJNgQveDgpz53gKmloldu30fs6HEd+VCwZEv348vJk/DEn7uk+i/7zsgdeXqc0Y9JX1T3gKCo7N5
+EUtM/+tJ2HRRz5uiR3RtbGW1GEhJ4RW+pe1c1uvtvMAp4/1NRK0DbLaJ/8dhWt624bKEO39WhZC
Kv6CZsZ2MVIMzfE8JMptVbRboZ/ozOG5byNveCSskCi6ZJub1MJZB9NhN1drZQ6AOXNmKG2Mj+Kq
MFQ=
=4hLW
-----END PGP SIGNATURE-----

--------------Qwo3ITznHjDSI4DkAtiLooRb--
