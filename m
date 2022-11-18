Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAF362F9BE
	for <lists+linux-tegra@lfdr.de>; Fri, 18 Nov 2022 16:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235186AbiKRPyh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 18 Nov 2022 10:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234971AbiKRPyf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 10:54:35 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D4C7D521;
        Fri, 18 Nov 2022 07:54:34 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 52F7E22907;
        Fri, 18 Nov 2022 15:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1668786873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ie4rP1zP9ZImaMKnE6o4mfW5YHg3lY9uIgwnDniBuwk=;
        b=SnhT7s/QJSA5+zra838tdjLvvSkyniKV/Ttk678z9DT52La8hBfwFNqzHEqA0uDywa5Fgv
        uboOBh7sJAquLnCngkW6A7v8twvz1w1dEx96Y0wsm9cHi9vEywSSx6QtYSq5547uA7+pC1
        m0qfwsrcuJZ9yarkH6NlL7z1PzXQNfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1668786873;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ie4rP1zP9ZImaMKnE6o4mfW5YHg3lY9uIgwnDniBuwk=;
        b=wcSegVH6PpmZov/e22gHGL++Xcc2PX7/T+/MU31TdxNujGC5jAz/yvXVoXEo9bzovMc7yh
        1/QSc8ly7kREvCCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECFAA13A66;
        Fri, 18 Nov 2022 15:54:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id SKFkN7iqd2N5dQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 15:54:32 +0000
Message-ID: <9bf3dde1-dbbf-a03f-6659-68ecd4fce8cf@suse.de>
Date:   Fri, 18 Nov 2022 16:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 5/8] drm/simpledrm: Add support for system memory
 framebuffers
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        David Airlie <airlied@redhat.com>,
        Robin Murphy <robin.murphy@arm.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-6-thierry.reding@gmail.com>
 <053fbbc2-824d-648b-fdac-6f6c7c64181d@suse.de> <Y3em7dwyJgQI1vZw@orome>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y3em7dwyJgQI1vZw@orome>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HiXdb2m9oNa1iQFFHPXIKbJx"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HiXdb2m9oNa1iQFFHPXIKbJx
Content-Type: multipart/mixed; boundary="------------aMQqydApo3k60vaPa0bSrIXJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 David Airlie <airlied@redhat.com>, Robin Murphy <robin.murphy@arm.com>
Message-ID: <9bf3dde1-dbbf-a03f-6659-68ecd4fce8cf@suse.de>
Subject: Re: [PATCH v3 5/8] drm/simpledrm: Add support for system memory
 framebuffers
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-6-thierry.reding@gmail.com>
 <053fbbc2-824d-648b-fdac-6f6c7c64181d@suse.de> <Y3em7dwyJgQI1vZw@orome>
In-Reply-To: <Y3em7dwyJgQI1vZw@orome>

--------------aMQqydApo3k60vaPa0bSrIXJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMTEuMjIgdW0gMTY6Mzggc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
T24gRnJpLCBOb3YgMTgsIDIwMjIgYXQgMDM6MjE6MTRQTSArMDEwMCwgVGhvbWFzIFppbW1l
cm1hbm4gd3JvdGU6DQo+PiBIaQ0KPj4NCj4+IEFtIDE3LjExLjIyIHVtIDE5OjQwIHNjaHJp
ZWIgVGhpZXJyeSBSZWRpbmc6DQo+Pj4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdA
bnZpZGlhLmNvbT4NCj4+Pg0KPj4+IFNpbXBsZSBmcmFtZWJ1ZmZlcnMgY2FuIGJlIHNldCB1
cCBpbiBzeXN0ZW0gbWVtb3J5LCB3aGljaCBjYW5ub3QgYmUNCj4+PiByZXF1ZXN0ZWQgYW5k
L29yIEkvTyByZW1hcHBlZCB1c2luZyB0aGUgSS9PIHJlc291cmNlIGhlbHBlcnMuIEFkZCBh
DQo+Pj4gc2VwYXJhdGUgY29kZSBwYXRoIHRoYXQgb2J0YWlucyBzeXN0ZW0gbWVtb3J5IGZy
YW1lYnVmZmVycyBmcm9tIHRoZQ0KPj4+IHJlc2VydmVkIG1lbW9yeSByZWdpb24gcmVmZXJl
bmNlZCBpbiB0aGUgbWVtb3J5LXJlZ2lvbiBwcm9wZXJ0eS4NCj4+Pg0KPj4+IFNpZ25lZC1v
ZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+DQo+Pj4gLS0tDQo+
Pj4gQ2hhbmdlcyBpbiB2MzoNCj4+PiAtIHNpbXBsaWZ5IG1lbW9yeSBjb2RlIGFuZCBtb3Zl
IGJhY2sgdG8gc2ltcGxlZHJtX2RldmljZV9jcmVhdGUoKQ0KPj4+IC0gZXh0cmFjdCBzY3Jl
ZW5fYmFzZSBpb3N5c19tYXAgZml4IGludG8gc2VwYXJhdGUgcGF0Y2gNCj4+Pg0KPj4+IENo
YW5nZXMgaW4gdjI6DQo+Pj4gLSBtYWtlIHNjcmVlbiBiYXNlIGEgc3RydWN0IGlvc3lzX21h
cCB0byBhdm9pZCBzcGFyc2Ugd2FybmluZ3MNCj4+Pg0KPj4+ICAgIGRyaXZlcnMvZ3B1L2Ry
bS90aW55L3NpbXBsZWRybS5jIHwgOTkgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0NCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRp
b25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2lt
cGxlZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPj4+IGluZGV4
IDM2NzNhNDJlNGJmNC4uN2YzOWJjNThkYTUyIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rp
bnkvc2ltcGxlZHJtLmMNCj4+PiBAQCAtMyw2ICszLDcgQEANCj4+PiAgICAjaW5jbHVkZSA8
bGludXgvY2xrLmg+DQo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L29mX2Nsay5oPg0KPj4+ICAg
ICNpbmNsdWRlIDxsaW51eC9taW5tYXguaD4NCj4+PiArI2luY2x1ZGUgPGxpbnV4L29mX2Fk
ZHJlc3MuaD4NCj4+PiAgICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGF0YS9zaW1wbGVm
Yi5oPg0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4+PiAg
ICAjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+DQo+Pj4gQEAgLTE4NCw2
ICsxODUsMzEgQEAgc2ltcGxlZmJfZ2V0X2Zvcm1hdF9vZihzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm9mX25vZGUpDQo+Pj4gICAgCXJldHVybiBzaW1w
bGVmYl9nZXRfdmFsaWRhdGVkX2Zvcm1hdChkZXYsIGZvcm1hdCk7DQo+Pj4gICAgfQ0KPj4+
ICtzdGF0aWMgc3RydWN0IHJlc291cmNlICoNCj4+PiArc2ltcGxlZmJfZ2V0X21lbW9yeV9v
ZihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm9mX25vZGUp
DQo+Pj4gK3sNCj4+PiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7DQo+Pj4gKwlzdHJ1Y3Qg
cmVzb3VyY2UgKnJlczsNCj4+PiArCWludCBlcnI7DQo+Pj4gKw0KPj4+ICsJbnAgPSBvZl9w
YXJzZV9waGFuZGxlKG9mX25vZGUsICJtZW1vcnktcmVnaW9uIiwgMCk7DQo+Pj4gKwlpZiAo
IW5wKQ0KPj4+ICsJCXJldHVybiBOVUxMOw0KPj4+ICsNCj4+PiArCXJlcyA9IGRldm1fa3ph
bGxvYyhkZXYtPmRldiwgc2l6ZW9mKCpyZXMpLCBHRlBfS0VSTkVMKTsNCj4+PiArCWlmICgh
cmVzKQ0KPj4+ICsJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPj4+ICsNCj4+PiArCWVy
ciA9IG9mX2FkZHJlc3NfdG9fcmVzb3VyY2UobnAsIDAsIHJlcyk7DQo+Pj4gKwlpZiAoZXJy
KQ0KPj4+ICsJCXJldHVybiBFUlJfUFRSKGVycik7DQo+Pj4gKw0KPj4+ICsJaWYgKG9mX2dl
dF9wcm9wZXJ0eShvZl9ub2RlLCAicmVnIiwgTlVMTCkpDQo+Pj4gKwkJZHJtX3dhcm4oZGV2
LCAicHJlZmVycmluZyBcIm1lbW9yeS1yZWdpb25cIiBvdmVyIFwicmVnXCIgcHJvcGVydHlc
biIpOw0KPj4NCj4+IFRoZSByZWcgcHJvcGVydHkgaXMgY29udmVydGVkIHRvIGEgZGV2aWNl
IHJlc291cmNlIHdoZW4gd2UgY3JlYXRlIHRoZSBkZXZpY2UNCj4+IGF0IFsxXS4NCj4+DQo+
PiBJIGhhdmUgYW5vdGhlciBxdWVzdGlvbiwgd2hpY2ggSSB3YXMgZGlzY3Vzc2luZyB3aXRo
IEphdmllciByZWNlbnRseS4gSXMgaXQNCj4+IHBvc3NpYmxlIHRvIGhhbmRsZSBtZW1vcnkt
cmVnaW9uIHRoZXJlIGF1dG9tYXRpY2FsbHk/IElmLCBmb3IgZXhtYXBsZSwgaXQNCj4+IHdv
dWxkIGNyZWF0ZSBhIHJlc291cmNlIHdpdGggSU9SRVNPVVJDRV9DQUNIRUFCTEUsIHNpbXBs
ZWRybSB3b3VsZCBoYW5kbGUgaXQNCj4+IGFzIG1lbW9yeSByZWdpb24uIFdpdGhvdXQgdGhl
IENBQ0hFQUJMRSBmbGFnLCBpdCB3b3VsZCBiZSBhIHJlZ3VsYXIgcmVzb3VyY2UNCj4+IGFz
IGJlZm9yZS4NCj4gDQo+IG1lbW9yeS1yZWdpb24gcHJvcGVydGllcyBhcmUgbm90IHR5cGlj
YWxseSBjb252ZXJ0ZWQgaW50byBhIHN0YW5kYXJkDQo+IHJlc291cmNlIGF1dG9tYXRpY2Fs
bHkuIE9uZSByZWFzb24gbWF5IGJlIHRoYXQgdGhleSBjYW4gaGF2ZSBhZGRpdGlvbmFsDQo+
IHByb3BlcnRpZXMgYXNzb2NpYXRlZCB3aXRoIHRoZW0gYW5kIHNvIHNvbWV0aGluZyBsaWtl
IGEgQ0FDSEVBQkxFIHR5cGUNCj4gbWF5IG5vdCBhcHBseS4NCj4gDQo+IEl0J3MgYWxzbyBz
dGFuZGFyZCB0byBjb252ZXJ0ICJyZWciIHByb3BlcnRpZXMgaW50byBzdHJ1Y3QgcmVzb3Vy
Y2UgYW5kDQo+IHRoYXQncyB3aGF0IG1hbnkgZHJpdmVycyB3aWxsIGV4cGVjdC4gSSBkb24n
dCBrbm93IGlmIGFsbCBkcml2ZXJzIHdpbGwNCj4gZ3JhY2VmdWxseSBoYW5kbGUgYmVpbmcg
cGFzc2VkIGEgc3RydWN0IHJlc291cmNlIHRoYXQgd2FzIGNyZWF0ZWQgaW4NCj4gdGhpcyB3
YXkgZnJvbSBhIG1lbW9yeS1yZWdpb24gcHJvcGVydHkuIElmIGF0IGFsbCBJIHRoaW5rIHRo
aXMgd291bGQNCj4gbmVlZCB0byBiZSBzcGVjaWFsLWNhc2VkIGZvciBzaW1wbGUtZnJhbWVi
dWZmZXIsIGluIHdoaWNoIGNhc2UgSSdtIG5vdA0KPiBjb252aW5jZWQgdGhhdCBwdXR0aW5n
IHRoZSBzcGVjaWFsIGNhc2UgaW50byB0aGUgY29yZSBPRiBjb2RlIGlzIGFueQ0KPiBiZXR0
ZXIgdGhhbiBwdXR0aW5nIGl0IGludG8gdGhlIHNpbXBsZWRybSBkcml2ZXIuDQo+IA0KPiBB
bHNvLCBldmVuIGlmIHdlIGRpZCBzbywgd2hhdCB3b3VsZCBpdCByZWFsbHkgY2hhbmdlPyBX
ZSBtYXkgYmUgYWJsZSB0bw0KPiBhdm9pZCB0aGUgZXhwbGljaXQgRFQgbG9va3VwLCBidXQg
dGhlIGJ1bGsgb2YgdGhlIG1lbW9yeS1yZWdpb24gY29kZSBpcw0KPiBhY3R1YWxseSBtYXBw
aW5nIGl0LCBldGMuIFRoYXQgcGFydCB3ZSB3b24ndCBiZSBhYmxlIHRvIGF1dG9tYXRpY2Fs
bHkNCj4gaGFuZGxlLCBJIHRoaW5rLg0KPiANCj4gVWx0aW1hdGVseSB0aGlzIGlzIHVwIHRv
IFJvYiwgbm90IHN1cmUgaWYgaGUnbGwgd2FudCB0byBleHRlbmQgdGhlDQo+IHNpbXBsZS1m
cmFtZWJ1ZmZlciBub2RlIGNyZWF0aW9uIGNvZGUgYW55IGZ1cnRoZXIuDQoNClRoYW5rcyBm
b3IgZXhwbGFpbmluZy4gSXQgd2FzIHNpbXBseSBzb21ldGhpbmcgd2Ugd29uZGVyZWQgYWJv
dXQuDQoNClRoZSBzaW1wbGVkcm0gZGV2aWNlIGRyaXZlciBoYW5kcyBvdmVyIGRldmljZSBv
d25lcnNoaXAgdG8gdGhlIA0KaGFyZHdhcmUncyBuYXRpdmUgZHJpdmVyIGR1cmluZyB0aGUg
Ym9vdCBwcm9jZXNzLiBUbyBtYWtlIHRoaXMgd29yayBpbiANCmFsbCBjYXNlcywgdGhlIE9G
IGNvZGUgbmVlZHMgdG8gYmUgaW52b2x2ZWQuIFNvIGF0IHNvbWUgcG9pbnQsIHdlJ2xsIA0K
bmVlZCB0byBtb3ZlIHNvbWUgb2YgdGhlIG1lbW9yeS1yZWdpb24gY29kZSBpbnRvIHRoZSBP
RiBjb2RlLiBCdXQgaG93IA0KZXhhY3RseSB0aGlzIGhhcyB0byBiZSBkb25lIGNhbiBiZSBk
aXNjdXNzZWQgbGF0ZXIuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRoaWVy
cnkNCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+PiBbMV0NCj4+
IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjAuOS9zb3VyY2UvZHJpdmVy
cy9vZi9wbGF0Zm9ybS5jI0w1ODYNCj4+DQo+Pj4gKw0KPj4+ICsJcmV0dXJuIHJlczsNCj4+
PiArfQ0KPj4+ICsNCj4+PiAgICAvKg0KPj4+ICAgICAqIFNpbXBsZSBGcmFtZWJ1ZmZlciBk
ZXZpY2UNCj4+PiAgICAgKi8NCj4+PiBAQCAtNjIzLDggKzY0OSw3IEBAIHN0YXRpYyBzdHJ1
Y3Qgc2ltcGxlZHJtX2RldmljZSAqc2ltcGxlZHJtX2RldmljZV9jcmVhdGUoc3RydWN0IGRy
bV9kcml2ZXIgKmRydiwNCj4+PiAgICAJc3RydWN0IGRybV9kZXZpY2UgKmRldjsNCj4+PiAg
ICAJaW50IHdpZHRoLCBoZWlnaHQsIHN0cmlkZTsNCj4+PiAgICAJY29uc3Qgc3RydWN0IGRy
bV9mb3JtYXRfaW5mbyAqZm9ybWF0Ow0KPj4+IC0Jc3RydWN0IHJlc291cmNlICpyZXMsICpt
ZW07DQo+Pj4gLQl2b2lkIF9faW9tZW0gKnNjcmVlbl9iYXNlOw0KPj4+ICsJc3RydWN0IHJl
c291cmNlICpyZXMsICptZW0gPSBOVUxMOw0KPj4+ICAgIAlzdHJ1Y3QgZHJtX3BsYW5lICpw
cmltYXJ5X3BsYW5lOw0KPj4+ICAgIAlzdHJ1Y3QgZHJtX2NydGMgKmNydGM7DQo+Pj4gICAg
CXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsNCj4+PiBAQCAtNjc2LDYgKzcwMSw5IEBA
IHN0YXRpYyBzdHJ1Y3Qgc2ltcGxlZHJtX2RldmljZSAqc2ltcGxlZHJtX2RldmljZV9jcmVh
dGUoc3RydWN0IGRybV9kcml2ZXIgKmRydiwNCj4+PiAgICAJCWZvcm1hdCA9IHNpbXBsZWZi
X2dldF9mb3JtYXRfb2YoZGV2LCBvZl9ub2RlKTsNCj4+PiAgICAJCWlmIChJU19FUlIoZm9y
bWF0KSkNCj4+PiAgICAJCQlyZXR1cm4gRVJSX0NBU1QoZm9ybWF0KTsNCj4+PiArCQltZW0g
PSBzaW1wbGVmYl9nZXRfbWVtb3J5X29mKGRldiwgb2Zfbm9kZSk7DQo+Pj4gKwkJaWYgKElT
X0VSUihtZW0pKQ0KPj4+ICsJCQlyZXR1cm4gRVJSX0NBU1QobWVtKTsNCj4+PiAgICAJfSBl
bHNlIHsNCj4+PiAgICAJCWRybV9lcnIoZGV2LCAibm8gc2ltcGxlZmIgY29uZmlndXJhdGlv
biBmb3VuZFxuIik7DQo+Pj4gICAgCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsNCj4+PiBA
QCAtNjk4LDMyICs3MjYsNTUgQEAgc3RhdGljIHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpz
aW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LA0KPj4+ICAg
IAkgKiBNZW1vcnkgbWFuYWdlbWVudA0KPj4+ICAgIAkgKi8NCj4+PiAtCXJlcyA9IHBsYXRm
b3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+Pj4gLQlpZiAo
IXJlcykNCj4+PiAtCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4+PiArCWlmIChtZW0p
IHsNCj4+PiArCQl2b2lkICpzY3JlZW5fYmFzZTsNCj4+PiAtCXJldCA9IGRldm1fYXBlcnR1
cmVfYWNxdWlyZV9mcm9tX2Zpcm13YXJlKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6
ZShyZXMpKTsNCj4+PiAtCWlmIChyZXQpIHsNCj4+PiAtCQlkcm1fZXJyKGRldiwgImNvdWxk
IG5vdCBhY3F1aXJlIG1lbW9yeSByYW5nZSAlcHI6IGVycm9yICVkXG4iLCByZXMsIHJldCk7
DQo+Pj4gLQkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4+PiAtCX0NCj4+PiArCQlyZXQgPSBk
ZXZtX2FwZXJ0dXJlX2FjcXVpcmVfZnJvbV9maXJtd2FyZShkZXYsIG1lbS0+c3RhcnQsIHJl
c291cmNlX3NpemUobWVtKSk7DQo+Pj4gKwkJaWYgKHJldCkgew0KPj4+ICsJCQlkcm1fZXJy
KGRldiwgImNvdWxkIG5vdCBhY3F1aXJlIG1lbW9yeSByYW5nZSAlcHI6ICVkXG4iLCBtZW0s
IHJldCk7DQo+Pj4gKwkJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+Pj4gKwkJfQ0KPj4+IC0J
bWVtID0gZGV2bV9yZXF1ZXN0X21lbV9yZWdpb24oJnBkZXYtPmRldiwgcmVzLT5zdGFydCwg
cmVzb3VyY2Vfc2l6ZShyZXMpLCBkcnYtPm5hbWUpOw0KPj4+IC0JaWYgKCFtZW0pIHsNCj4+
PiAtCQkvKg0KPj4+IC0JCSAqIFdlIGNhbm5vdCBtYWtlIHRoaXMgZmF0YWwuIFNvbWV0aW1l
cyB0aGlzIGNvbWVzIGZyb20gbWFnaWMNCj4+PiAtCQkgKiBzcGFjZXMgb3VyIHJlc291cmNl
IGhhbmRsZXJzIHNpbXBseSBkb24ndCBrbm93IGFib3V0LiBVc2UNCj4+PiAtCQkgKiB0aGUg
SS9PLW1lbW9yeSByZXNvdXJjZSBhcy1pcyBhbmQgdHJ5IHRvIG1hcCB0aGF0IGluc3RlYWQu
DQo+Pj4gLQkJICovDQo+Pj4gLQkJZHJtX3dhcm4oZGV2LCAiY291bGQgbm90IGFjcXVpcmUg
bWVtb3J5IHJlZ2lvbiAlcHJcbiIsIHJlcyk7DQo+Pj4gLQkJbWVtID0gcmVzOw0KPj4+IC0J
fQ0KPj4+ICsJCWRybV9pbmZvKGRldiwgInVzaW5nIHN5c3RlbSBtZW1vcnkgZnJhbWVidWZm
ZXIgYXQgJXByXG4iLCBtZW0pOw0KPj4+IC0Jc2NyZWVuX2Jhc2UgPSBkZXZtX2lvcmVtYXBf
d2MoJnBkZXYtPmRldiwgbWVtLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShtZW0pKTsNCj4+PiAt
CWlmICghc2NyZWVuX2Jhc2UpDQo+Pj4gLQkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+
Pj4gKwkJc2NyZWVuX2Jhc2UgPSBkZXZtX21lbXJlbWFwKGRldi0+ZGV2LCBtZW0tPnN0YXJ0
LCByZXNvdXJjZV9zaXplKG1lbSksIE1FTVJFTUFQX1dCKTsNCj4+PiArCQlpZiAoIXNjcmVl
bl9iYXNlKQ0KPj4+ICsJCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4+PiArDQo+Pj4g
KwkJaW9zeXNfbWFwX3NldF92YWRkcigmc2Rldi0+c2NyZWVuX2Jhc2UsIHNjcmVlbl9iYXNl
KTsNCj4+PiArCX0gZWxzZSB7DQo+Pj4gKwkJdm9pZCBfX2lvbWVtICpzY3JlZW5fYmFzZTsN
Cj4+PiArDQo+Pj4gKwkJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVT
T1VSQ0VfTUVNLCAwKTsNCj4+PiArCQlpZiAoIXJlcykNCj4+PiArCQkJcmV0dXJuIEVSUl9Q
VFIoLUVJTlZBTCk7DQo+Pj4gLQlpb3N5c19tYXBfc2V0X3ZhZGRyX2lvbWVtKCZzZGV2LT5z
Y3JlZW5fYmFzZSwgc2NyZWVuX2Jhc2UpOw0KPj4+ICsJCXJldCA9IGRldm1fYXBlcnR1cmVf
YWNxdWlyZV9mcm9tX2Zpcm13YXJlKGRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShy
ZXMpKTsNCj4+PiArCQlpZiAocmV0KSB7DQo+Pj4gKwkJCWRybV9lcnIoZGV2LCAiY291bGQg
bm90IGFjcXVpcmUgbWVtb3J5IHJhbmdlICVwcjogJWRcbiIsICZyZXMsIHJldCk7DQo+Pj4g
KwkJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+Pj4gKwkJfQ0KPj4+ICsNCj4+PiArCQlkcm1f
aW5mbyhkZXYsICJ1c2luZyBJL08gbWVtb3J5IGZyYW1lYnVmZmVyIGF0ICVwclxuIiwgcmVz
KTsNCj4+PiArDQo+Pj4gKwkJbWVtID0gZGV2bV9yZXF1ZXN0X21lbV9yZWdpb24oJnBkZXYt
PmRldiwgcmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMpLA0KPj4+ICsJCQkJCSAgICAg
IGRydi0+bmFtZSk7DQo+Pj4gKwkJaWYgKCFtZW0pIHsNCj4+PiArCQkJLyoNCj4+PiArCQkJ
ICogV2UgY2Fubm90IG1ha2UgdGhpcyBmYXRhbC4gU29tZXRpbWVzIHRoaXMgY29tZXMgZnJv
bSBtYWdpYw0KPj4+ICsJCQkgKiBzcGFjZXMgb3VyIHJlc291cmNlIGhhbmRsZXJzIHNpbXBs
eSBkb24ndCBrbm93IGFib3V0LiBVc2UNCj4+PiArCQkJICogdGhlIEkvTy1tZW1vcnkgcmVz
b3VyY2UgYXMtaXMgYW5kIHRyeSB0byBtYXAgdGhhdCBpbnN0ZWFkLg0KPj4+ICsJCQkgKi8N
Cj4+PiArCQkJZHJtX3dhcm4oZGV2LCAiY291bGQgbm90IGFjcXVpcmUgbWVtb3J5IHJlZ2lv
biAlcHJcbiIsIHJlcyk7DQo+Pj4gKwkJCW1lbSA9IHJlczsNCj4+PiArCQl9DQo+Pj4gKw0K
Pj4+ICsJCXNjcmVlbl9iYXNlID0gZGV2bV9pb3JlbWFwX3djKCZwZGV2LT5kZXYsIG1lbS0+
c3RhcnQsIHJlc291cmNlX3NpemUobWVtKSk7DQo+Pj4gKwkJaWYgKCFzY3JlZW5fYmFzZSkN
Cj4+PiArCQkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+Pj4gKw0KPj4+ICsJCWlvc3lz
X21hcF9zZXRfdmFkZHJfaW9tZW0oJnNkZXYtPnNjcmVlbl9iYXNlLCBzY3JlZW5fYmFzZSk7
DQo+Pj4gKwl9DQo+Pj4gICAgCS8qDQo+Pj4gICAgCSAqIE1vZGVzZXR0aW5nDQo+Pg0KPj4g
LS0gDQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KPj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+IChIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCj4+IEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCj4gDQo+IA0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------aMQqydApo3k60vaPa0bSrIXJ--

--------------HiXdb2m9oNa1iQFFHPXIKbJx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN3qrgFAwAAAAAACgkQlh/E3EQov+CS
eBAAxLdwTKD38mqWgPgD4399VMchNAQn9fb0wx26aWblc7VWoQcsEKhheUGIKLLclQBoJGKvAf1T
2F49lEqmG/SW6jns9zN0pw3nTREMn30GBCv4vJSd7DUy06l5oRrny8gxjuFKdZpvOoHAdnGuNdj1
/6YUYd09lTktqExWZmCsbuIX1c/NHwAuVdha42tFsXOF9QtfIBaSmp/07o3uvFUgE3Eu+jO6tHgY
XplsI5MSSABbTWkuhwBGPLw7MA3cRVLg1qN7zVJ+TpLUmgv004moKIpDM43Npj833/tG06ZsB/pg
2DhVNeKs1fMf1stMuPdKr0M27+N2xMCdJa1sWSStZRiHAdrVitm/TrF6ln4rR+Y06EI+Yhtr+75X
xtrsgQp0jjkFOvncI6olTFtT2rjoZ0qA16zwr2GI+SdyC1Z3oeuZaRCpffCsWsrvvx142SwLw9cA
wvDRMSejelZ+xi0pMH6lDAucfPM+WV1NApWKpOpq0Y8tePLGL5C9P4TdtmFkQ0oYfdq38i74Z6OW
iyYgYCKF0s8CqDzSlTnGXqUJD/k2KuYGm8/F1K+O5FeGAp97nH5rolJNx7cuKvhazBXsYm9kvvxK
37viysETb7CgnKXPcgOz9bcNx8zhEGkEH+9XhjuyUCNsWeP36JMbVAraJYmQ/n0VYumE/q5zXrNJ
UFw=
=xNOw
-----END PGP SIGNATURE-----

--------------HiXdb2m9oNa1iQFFHPXIKbJx--
