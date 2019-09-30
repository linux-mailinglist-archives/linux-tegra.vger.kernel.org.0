Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCFAC1C4C
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 09:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfI3Hse (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 03:48:34 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:39462 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfI3Hse (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 03:48:34 -0400
Received: by mail-wr1-f45.google.com with SMTP id r3so10019866wrj.6
        for <linux-tegra@vger.kernel.org>; Mon, 30 Sep 2019 00:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AIDlMEbJEkZs/uLgY7OIJqqA4vvbYolHgd0D+9Yx+II=;
        b=EhBORIxq/fmIoru5kypQPu41TY+OvJ0INtYiHLmMuzDZ+HEVsKbss9h34IRTgqMtg0
         yv/qdl3TudsrSvCE6NYA2LEBzr4SQ/jH17FKymSB/qCwmE1H0bNxa2rQQ/am8D0Vmbgq
         vjY2NKInUIsinZHq7HaUeFsMXRD56X71cckU0t2VHt4/pEf9qth73nkZi7dZWYagCS5O
         KpJxv/mo23DQQlNmwKwI4BM3dBJyKcQcw0OY5+slSWA8CIkH9B5sxhOkNIa6ul1ZenlV
         8v7PJdhzh3NX9Z53UQ0eX13JsO2pyC0yDF08dXkSeKD1ucwwBcpH+WPZycONyqMKHNc3
         mDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AIDlMEbJEkZs/uLgY7OIJqqA4vvbYolHgd0D+9Yx+II=;
        b=bnriPlGe6zEVjYRz14CHyBs05eNmenmBw3mg0fUfYt3j8Vp4CbRIHUZ+HCcpyHmhae
         co+XvliK2SMUHQWQwahWilaEG+7gcDyJfZJCngB/FpP7YhdBZ8FPI0pq/EoO6ttcZNhm
         DaEuPwnekaakFBmzP5GfuTf6vXY92OXUtTnQlIKKdpipjV/yf3Iv3w1R9F5kYWILsT2B
         iKnfjb30yL+bu+Vr+9RhbqEb0+zTvnYULaef5s1Be6Slc2MnAgBv08LOjcDCNdd+SdQp
         A8Q/A9eZVx++qjo215yZuGdem7dmU+n7/+xFli1e/b0Ee0p7M4a22qBj5q7caT4CWA+2
         ClUg==
X-Gm-Message-State: APjAAAUkEOyL3GOOAfIcLxXafABhbk6TwfZzSbC6cdZVzB4S8WcTSikF
        nip1CyV5caNQzeRmHG08NKs=
X-Google-Smtp-Source: APXvYqyA9hHDpx6Td83xtabq0H+3qG0jPsmd361LvdeJAcdzKcUVQQhPDiUcNS7V5zjO/OEZhpV7kA==
X-Received: by 2002:adf:ea10:: with SMTP id q16mr12731299wrm.356.1569829711372;
        Mon, 30 Sep 2019 00:48:31 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id f66sm15296283wmg.2.2019.09.30.00.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 00:48:30 -0700 (PDT)
Date:   Mon, 30 Sep 2019 09:48:29 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
Message-ID: <20190930074829.GD1518582@ulmo>
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
 <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Content-Disposition: inline
In-Reply-To: <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2019 at 08:33:50PM -0400, Peter Geis wrote:
> Good Evening,
>=20
> While testing Dmitry's cpuidle driver I found that tegra-udc is broken
> completely on linux-next.
> Even in peripheral mode, disconnected from the host, it locks at the same=
 place.

Odd... do you think you could run a bisection to find out which commit
is responsible for breaking this? This was definitely working in v4.14
when it was merged (though I obviously only tested the platforms that
I have access to). The bisection is going to be pretty long since this
is about 2 years worth of kernel development. Perhaps start from 5.3 (I
suspect that that will be broken as well) and work your way backwards
until you find a release that works, then bisect between that and the
latest that didn't work.

Thierry

>=20
> [    2.864983] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    2.871723] tegra-ehci: Tegra EHCI driver
> [    2.880593] tegra-ehci 7d004000.usb: EHCI Host Controller
> [    2.886484] tegra-ehci 7d004000.usb: new USB bus registered,
> assigned bus number 1
> [    2.895250] tegra-ehci 7d004000.usb: irq 88, io mem 0x7d004000
> [    2.916528] tegra-ehci 7d004000.usb: USB 2.0 started, EHCI 1.00
> [    2.927441] hub 1-0:1.0: USB hub found
> [    2.931479] hub 1-0:1.0: 1 port detected
> [    2.939124] usbcore: registered new interface driver cdc_acm
> [    2.944889] cdc_acm: USB Abstract Control Model driver for USB
> modems and ISDN adapters
> [    2.953185] usbcore: registered new interface driver cdc_wdm
> [    2.959107] usbcore: registered new interface driver uas
> [    2.964824] usbcore: registered new interface driver usb-storage
> [    2.974726] tegra-udc 7d000000.usb: 7d000000.usb supply vbus not
> found, using dummy regulator
> [    2.990506] ci_hdrc ci_hdrc.0: EHCI Host Controller
> [    2.992320] udc ci_hdrc.0: registering UDC driver [g_ncm]
> [    2.995708] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus nu=
mber 2
> [    3.001232] using random self ethernet address
> [    3.012631] using random host ethernet address
> [    3.017190] g_ncm gadget: adding config #1 'CDC Ethernet (NCM)'/(ptrva=
l)
> [    3.020523] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
> [    3.024058] g_ncm gadget: adding 'cdc_network'/(ptrval) to config
> 'CDC Ethernet (NCM)'/(ptrval)
> [    3.033578] hub 2-0:1.0: USB hub found
> [    3.041721] usb0: HOST MAC 9e:a2:94:94:76:53
> [    3.042085] hub 2-0:1.0: 1 port detected
> [    3.046706] usb0: MAC b2:13:8e:20:a9:fa
> [    3.054215] g_ncm gadget: CDC Network: dual speed IN/ep1in
> OUT/ep1out NOTIFY/ep2in
> [    3.061861] g_ncm gadget: cfg 1/(ptrval) speeds: high full
> [    3.067402] g_ncm gadget:   interface 0 =3D cdc_network/(ptrval)
> [    3.073292] g_ncm gadget:   interface 1 =3D cdc_network/(ptrval)
> [    3.079206] g_ncm gadget: NCM Gadget
> [    3.082843] g_ncm gadget: g_ncm ready
> [    3.091020] rtc rtc1: alarm rollover: day
> [    3.096710] tegra_rtc 7000e000.rtc: char device (253:1)
> [    3.102059] tegra_rtc 7000e000.rtc: registered as rtc1
> [    3.107257] tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
> [    3.114270] i2c /dev entries driver
> [    3.118781] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 bu=
sy
> [    3.128234] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 bu=
sy
> [    3.135069] tegra-apbdma 6000a000.dma: private_candidate: dma0chan1 bu=
sy
> [    3.141875] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 bu=
sy
> [    3.148644] tegra-apbdma 6000a000.dma: private_candidate: dma0chan1 bu=
sy
> [    3.155402] tegra-apbdma 6000a000.dma: private_candidate: dma0c
>=20
> Thank you for your time,
> Peter
>=20
> On Sun, Sep 29, 2019 at 6:15 PM Peter Geis <pgwipeout@gmail.com> wrote:
> >
> > Good Afternoon,
> >
> > So I have dug a bit further into it.
> > The tegra-udc driver defaults to host mode when set to otg.
> > If the tegra-udc driver is in host mode while plugged into another
> > host, the kernel will hard lock.
> > If the tegra-udc driver is in host mode with a device attached the
> > device enumerates correctly.
> > In this state, if you change the state to gadget, the driver goes into
> > a broken state.
> > The gadget side is in gadget mode, but the host does not enumerate the =
device.
> >
> > As it stands the code path for the tegra-udc driver is broken in OTG mo=
de.
> > Without proper extcon support we can't support dynamic switching
> > correctly anyways.
> > My hack around method of retaining the phy in peripheral mode and
> > switching drivers to change modes only works because both code paths
> > are incomplete as well, and should not be relied upon.
> >
> > I think for the time being, the tegra-udc driver should check for
> > host, peripheral, or otg mode.
> > If it detects the device is set to otg mode, it should print an error
> > message describing the current situation and fail out.
> >
> > If I had a device to test against with an extcon capable port, I'd try
> > some more experimenting with the chipidea drivers to see if I can get
> > it to work.
> >
> > What do you think?
> >
> > Dmitry,
> > Do you have any devices to experiment with this?
> >
> > Thank you for your time,
> > Peter
> >
> > On Sat, Sep 28, 2019 at 11:36 PM Peter Chen <peter.chen@nxp.com> wrote:
> > >
> > >
> > > >
> > > > I've encountered an odd situation where the CI Dual Role driver har=
d locks the
> > > > kernel on the Ouya (Tegra 3).
> > > > I was attempting to set up manual mode switching in the kernel, as =
the Ouya lacks
> > > > hardware support for the ID pin and no voltage output on that port.
> > > > I found that the kernel was hard locking whenever I had the dr_mode=
 =3D "otg" set in
> > > > the devicetree.
> > >
> > > It seems Tegra doesn't support host mode using chipidea driver. The c=
i_hdrc_tegra.c
> > > only supports device mode. Thierry, could you confirm that?
> > >
> > > Peter
> > >
> > > > No further output was seen on the console, and sysreq does not resp=
ond.
> > > > It occurs both in module and builtin mode.
> > > >
> > > > I have however found a workaround.
> > > > By setting the dual role usb device to:
> > > > compatible =3D "nvidia,tegra30-ehci", "nvidia,tegra30-udc"; and set=
ting the assigned
> > > > phy to:
> > > > dr_mode =3D "peripheral";
> > > > I can achieve rudimentary live switching of roles.
> > > > The device defaults to host mode, as the ehci driver enumerates fir=
st.
> > > > By unbinding the tegra-ehci driver and binding the tegra-udc driver=
, I can switch to
> > > > gadget mode.
> > > > The reverse also works.
> > > > The PHY driver does not appear to care if it is always in periphera=
l mode.
> > > >
> > > > Thank you for your time,
> > > > Peter Geis

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2Rs00ACgkQ3SOs138+
s6GPEA//b6RtXyC/M1chEW7yuQ48sFfQ9Yaaozs9LrfTOQkXhPf6Jatv6KRFpM7O
soD0gFP9EiCxcVSYa8BZhNtGFaiK9SIvdJ32NDp2Ch0Yrg4LMGtZYSrOE07ZH/ns
wbsKrYYMI4dgqiMl6Cx896qIjY7IIqvqJoROgPsIpXhDTiHLEb0mX85ddxwt8MWR
loU7RzWun7vKbVcDQ81Tx/VB/UKuIJNGQB0v576/n6eVjfIKVkMUOE5kKkcp6ztT
XLjIUdg65BU4fL/eBzBZL8Ylb5P2XguH3rOFs12CiXT0UH8EadniW8Onbxd2YSb2
Oy5gqs+Ij6ubh/Vn98cyQ+wR9bemy+/btgEHzIvzF1p5JKRExqsb39fyRVTplMqc
ZVNfKjQR/qajLVOp+KMVad0pLyVjkIyzc0my+0G6CXX8TV2ATsrzV4/+sF0EJelQ
dMEKslcJn6SYNGD3cS5ISKRA8Az882hha/UyOoX2W5TFP4WaAHYiPvVTEPSVgqVP
z94vmSp4mD+zkD1u1V3fkdqVtMzwRoKW6r7UqiCYNI3/CJvW4+a9eBOW2P+RnGwh
TVZmqv7hJQJ5Ibu28vqdLb5LHFQoabJK9DgWu1BY+WhlCz1PhnWzMtR2wmvfOjJD
onutBX8PrYRZ6X61jnAOnGErD1uTB4yxfXG0640ak5SHEESe278=
=W66V
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--
