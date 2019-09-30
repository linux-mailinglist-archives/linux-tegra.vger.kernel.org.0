Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0733C1C39
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 09:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729589AbfI3Hok (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 03:44:40 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55177 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfI3Hok (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 03:44:40 -0400
Received: by mail-wm1-f68.google.com with SMTP id p7so12156330wmp.4
        for <linux-tegra@vger.kernel.org>; Mon, 30 Sep 2019 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XoCWL6P9b9GP6wRLhhwkj2bq+VANpzsPMm2jq/YB8SQ=;
        b=f1leiZZ4iXyi9Wi0dLCnoFTJNzT2p53QkwwlrOSa/0YIDTKdFbHqvoyDqYKYc8Ms7x
         PzHFNfEmjxBcof2AUgEhwRvh4qa7OvpIqTCuVUFyw/ZUyXXUzpaD6cMD9fyl3l6+wd+0
         2xOmmBkEQQLugpYV/tBt5VCJ+BGAfFY8DhWp/4htGeafgHvfc/8lVWG28ksrptOrf5sO
         OAXWSdleRSocHfjEtxHAJvnpv0YUHqdjPiZjR3Pr26Uv/Fvl8JPqi7shAoE1Lb1lQQL7
         Z0Oa70DhTELoC3ao3nnxykfR2KHREN7b6kY0gLq8g11Pe3EnYwsPe0wbbP1qCycQGY2Z
         OXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XoCWL6P9b9GP6wRLhhwkj2bq+VANpzsPMm2jq/YB8SQ=;
        b=pX4nsHvmXZLNfjxn7zKYl/leGwNAkqbzvquMpbWZlm/yHB+Vxkmzg11zguSWksDUlV
         B9ZxEGHruzZP1T1Do/IJveRYukYXPG/+u0BoWjLw4Bwc/zyTQkTTWnNMrCT3jajMWnQT
         CEEo5+hgxQecldeMu+rdhE7ig5dC34rerGmtqBpiHNj2aCXCk6/vITx68BGnzynZ/EA/
         Kw/xgLwiU/UtK8iIngF61UeeipgmggjvL+89OXfrKja/ntWMtZQ9U7cJpsGWpxmhDWLt
         x984zlmNkG83zwXkh9Nm7XV1ylyzfaxHKdGUmgh19m3Si4rg4snWrEtyv0m8/5ZFXf6l
         PX+g==
X-Gm-Message-State: APjAAAUeuwQXVEa1ea8ipxpo3178gOjFjfZaNlv1TGliZZtYb/ReC5Ps
        W5+wkcxBhQ7AK5PtsckMAbQ=
X-Google-Smtp-Source: APXvYqymgtWLy4UPm4hPynLQdxjaCvtZUSErIIXaTE/mLD85VB1mMBOnEsFWG0Txle0HwaXDgSWqnw==
X-Received: by 2002:a1c:35c9:: with SMTP id c192mr15824205wma.91.1569829477055;
        Mon, 30 Sep 2019 00:44:37 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id g11sm14302744wmh.45.2019.09.30.00.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 00:44:35 -0700 (PDT)
Date:   Mon, 30 Sep 2019 09:44:34 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
Message-ID: <20190930074434.GC1518582@ulmo>
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Content-Disposition: inline
In-Reply-To: <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2019 at 06:15:40PM -0400, Peter Geis wrote:
> Good Afternoon,
>=20
> So I have dug a bit further into it.
> The tegra-udc driver defaults to host mode when set to otg.
> If the tegra-udc driver is in host mode while plugged into another
> host, the kernel will hard lock.
> If the tegra-udc driver is in host mode with a device attached the
> device enumerates correctly.
> In this state, if you change the state to gadget, the driver goes into
> a broken state.
> The gadget side is in gadget mode, but the host does not enumerate the de=
vice.
>=20
> As it stands the code path for the tegra-udc driver is broken in OTG mode.
> Without proper extcon support we can't support dynamic switching
> correctly anyways.
> My hack around method of retaining the phy in peripheral mode and
> switching drivers to change modes only works because both code paths
> are incomplete as well, and should not be relied upon.

OTG is not expected to work. I was never able to find hardware that
could reliably detect switching between host and peripheral modes, so I
ended up adding only peripheral support.

> I think for the time being, the tegra-udc driver should check for
> host, peripheral, or otg mode.
> If it detects the device is set to otg mode, it should print an error
> message describing the current situation and fail out.

Yeah, that sounds like a good idea. I guess I had assumed that hard-
coding the mode in device tree was enough, but I agree that it makes
life easier for users if they are warned if whatever changes they do
to the DT are not expected to work.

> If I had a device to test against with an extcon capable port, I'd try
> some more experimenting with the chipidea drivers to see if I can get
> it to work.
>=20
> What do you think?
>=20
> Dmitry,
> Do you have any devices to experiment with this?

As I mentioned in my earlier reply to Peter, I think it might even be
possible to move host support from the current ehci-tegra driver to the
ChipIdea driver. I recall from looking at this back at the time, that
the ChipIdea driver already has most of the code to deal with switching
modes and can even rely on an internal interrupt to detect a change in
the mode. Unfortunately I was never able to make that work, but you may
want to look at that again if you're interested.

In either case, having a patch that works about non-peripheral mode not
being supported sounds like a good idea. Could you prepare such a patch?

Thierry

> On Sat, Sep 28, 2019 at 11:36 PM Peter Chen <peter.chen@nxp.com> wrote:
> >
> >
> > >
> > > I've encountered an odd situation where the CI Dual Role driver hard =
locks the
> > > kernel on the Ouya (Tegra 3).
> > > I was attempting to set up manual mode switching in the kernel, as th=
e Ouya lacks
> > > hardware support for the ID pin and no voltage output on that port.
> > > I found that the kernel was hard locking whenever I had the dr_mode =
=3D "otg" set in
> > > the devicetree.
> >
> > It seems Tegra doesn't support host mode using chipidea driver. The ci_=
hdrc_tegra.c
> > only supports device mode. Thierry, could you confirm that?
> >
> > Peter
> >
> > > No further output was seen on the console, and sysreq does not respon=
d.
> > > It occurs both in module and builtin mode.
> > >
> > > I have however found a workaround.
> > > By setting the dual role usb device to:
> > > compatible =3D "nvidia,tegra30-ehci", "nvidia,tegra30-udc"; and setti=
ng the assigned
> > > phy to:
> > > dr_mode =3D "peripheral";
> > > I can achieve rudimentary live switching of roles.
> > > The device defaults to host mode, as the ehci driver enumerates first.
> > > By unbinding the tegra-ehci driver and binding the tegra-udc driver, =
I can switch to
> > > gadget mode.
> > > The reverse also works.
> > > The PHY driver does not appear to care if it is always in peripheral =
mode.
> > >
> > > Thank you for your time,
> > > Peter Geis

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2RsmIACgkQ3SOs138+
s6Hjew//WNFUtEgtUhMTAleQGJJMCXdIUHSl+pOGt2L7tur+eUc2s0fQTKj+3cIF
qE/ASii15T4ehd8CACdWQOrIsfGYAGmQLe1JJ8fd3CylsJeDKp7wOz7maUwM6T3o
0kv2srNainrA7qQZxcdB8JTjil64sZqnFu6mDccOVL5VLfLnID2yhnlctlDrxhUA
6jw/UdwCTYMhI+PrHEd77QUlBANQL6bBU9CqpBy63rYdLK9kz5G5l1FZJOl9s1lW
OWClsfeRhq/w3IKgHPgjAh2SDG7QZqSr1CsGt2NQqLZtknZc48dWPncpgq3zEAzb
iA0aFEh0wNyaR72x5jhslF3no226EuBZrrbJYIErtJfArsXVMv6S835hH+6efTY3
eWHz1M9dEX0hiKNLjp9fW7lD1cAX7Yt2GbGJ/wuvwnOHOO3ZA826J6KCZFoKXj03
guOt9ZSvLQS5KzIkdugtnrXOd0rUQyyyjdpNhamkYuAvaoQFBpzMU9Bquv7IcfwM
hEaOvQOEmVTXA17KMfK8j/EYtxxi0WzEwYB6nRlCme0DPzh+gxUR4in0Q5rHV0RA
TfBsVmIfNAQXXCPnHK9eU7ADXDqvgvBQ43i/B0L/V3GmzG1rjI43mpo1XttPF+SY
Op78u3FE8AllMP6zVkXLhsKznzZO67QkS8M36vqAgrvchkGaAkw=
=Xc+G
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--
