Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8C010CD69
	for <lists+linux-tegra@lfdr.de>; Thu, 28 Nov 2019 18:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfK1RE4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 28 Nov 2019 12:04:56 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52601 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfK1RE4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Nov 2019 12:04:56 -0500
Received: by mail-wm1-f65.google.com with SMTP id l1so11672161wme.2;
        Thu, 28 Nov 2019 09:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DU0UbbkQUUf0wPHoSDQ+hXP7J+kIuXbArXo42jHyBWY=;
        b=d9Cyo2cUVpxZPJiOrnWz08rWiiLGcD70sNDYE7cGcy3DpMFwalAt1g9UMVQAQ4ScVB
         RaExEDpJHhb/0hNlYP0f96g59JIgJqiDoMA6VbOko2B/8sH5qv01Bq1nErlxyJN/ohGM
         4RIFNe2Kesn0gMXK2EzbRSYLqZEb4Wbz6NfiuAHQJdqK5CNu1QPzL6NPZt7dUAHBLK17
         OsYsnbECEEfkNjBD8kbbxEWTcCQmt0yX4+u+BplpxaedO+N4G1uOY1zGmJ1bgzaI5tJ6
         Q4gXlvP0hH5KPpi0FPZpQ5PHpPMOnxzG96IRiEBKALzzAiiV8EZSIpPa/dLZf6hP3cCB
         aMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DU0UbbkQUUf0wPHoSDQ+hXP7J+kIuXbArXo42jHyBWY=;
        b=CcUkxLz7ljpw8COHOc21b/x3YBN53raK8g6RnL0TlNOaaO/6bib1I3mElv/r+6nz3w
         Dz9FQ+wuGiiTFLiTesVGm1JbSmNBaqRkoanZrpUrup4Y8RiFYAHgiSaVo0DsMTrkMEzL
         G2/msWNtiEiZJZpm4/4hZy35ufUeWtQyWn6sfXr2ZAhSGw2aSZTF6tKVVgt47aa3Us7E
         ANJqap1sy1x3NCTF0es1o1AJBv35lxIQ00+nnELR9xT9tMLwuDN82omXhFVfc0pcrCRM
         g3JFIWn/oepbf1uaEOE7P9MPIzu7vbVlJkwM1noXNShlmg+WQJtj5N6Q9X4Thmjak49M
         qLKQ==
X-Gm-Message-State: APjAAAUdAEAuSr1VQWo78/5hqQ19GBrkxZayV6j2Kxj8nde4eGMWYFAY
        5V2Ql/GfBevWFgPmw15ZHOU=
X-Google-Smtp-Source: APXvYqxtuPPoSZsAb49POnqcYCrsGaXg0yJYNzvZL31G/+bFp+wmpOIjZxyJ+dsmYeg6sYW38zrW6w==
X-Received: by 2002:a05:600c:2144:: with SMTP id v4mr3031194wml.31.1574960692917;
        Thu, 28 Nov 2019 09:04:52 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id z7sm10749829wma.46.2019.11.28.09.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 09:04:51 -0800 (PST)
Date:   Thu, 28 Nov 2019 18:04:50 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <len.brown@intel.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Pavel Machek <pavel@ucw.cz>, linux-tegra@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 0/2] PM / runtime: Allow drivers to override runtime PM
 behaviour on sleep
Message-ID: <20191128170450.GA2382346@ulmo>
References: <20191128160314.2381249-1-thierry.reding@gmail.com>
 <CAKMK7uFEwChTesKdWAOfi3evLO=d0MsPDdK8gizH-jLk4uBdFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline
In-Reply-To: <CAKMK7uFEwChTesKdWAOfi3evLO=d0MsPDdK8gizH-jLk4uBdFg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2019 at 05:47:05PM +0100, Daniel Vetter wrote:
> On Thu, Nov 28, 2019 at 5:03 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > This is a result of looking into a more formal way of doing what was
> > proposed here:
> >
> >         http://patchwork.ozlabs.org/patch/1145363/
> >
> > The Tegra DRM driver is written such that runtime PM controls all
> > aspects of bringing up and shutting down the hardware associated with a
> > display pipeline. This works very nicely with the DRM/KMS atomic mode-
> > setting framework that has very rigorous call sequences. There are also
> > suspend/resume helpers for system sleep that are built on top of these
> > generic helpers and that cause the same code sequences to be run as if
> > users had simply chosen to disable all display pipelines at normal
> > runtime.
> >
> > The current behaviour of the PM core to disallow runtime suspend/resume
> > during system sleep gets in the way of this because the devices do not
> > in fact runtime suspend/resume during that time. Most of the time this
> > causes display outputs to malfunction upon resume.
> >
> > Now, there are good reasons for preventing runtime suspend during system
> > sleep, as given in commit eea3fc0357eb ("PCI / PM: Detect early wakeup
> > in pci_pm_prepare()") that originally introduced this mechanism. There
> > can, however, also be cases, like the one described above, where it is
> > safe to allow this. Add a flag and a set of helpers to set or clear that
> > new flag so that drivers that know it will be safe to runtime suspend a
> > device at system sleep time can mark the device as such.
> >
> > If a device has the flag set, the PM core will no longer take a runtime
> > PM reference for it, thus allowing the device to runtime suspend at the
> > expected time.
>=20
> What about sprinkling tons of device_links all over this to make sure
> system suspend/resume is done in the same order too? Slightly less
> neat from a driver pov, but I think that should get the job done.
> Maybe could even do a convenience function which converts a dt phandle
> (or whatever that was called again) into a device_link?

That wouldn't actually fix the issue that I'm trying to solve. While it
seems like forcefully runtime suspending devices on system sleep, as is
done in Dmitry's patch that I linked to above, results in the system
resuming normally, I do recall that the exact point in time where we
reset and power-cycle the hardware can be crucial.

The strange thing is that I do recall this to have worked in the past.
This must have been around the time when we worked on atomic modesetting
(about 4 years ago) because all of the runtime PM code in Tegra DRM is
=66rom around that time. And I remember at the time thinking how neatly
this all fit together, because system suspend/resume really wasn't at
all a special case.

Unfortunately, looking at the git log I don't see how it ever could've
worked given that extra runtime PM reference that the PM core acquires.
I tried to go back and test on one of the old kernel trees, but I can't
find a GCC that builds those versions. I may need to go and dig through
some archives to find an old enough version.

Anyway, the situation being what it is, I think that quite a few of the
DRM/KMS drivers may be running into the same problem, since most today
use the drm_mode_config_helper_{suspend,resume}() helpers and quite a
few do pm_runtime_get_sync() in ->atomic_enable() and pm_runtime_put()
in ->atomic_disable(). Now, for some hardware it may not matter whether
we actually get suspended, but I'm not sure that's an assumption that
we can make.

One possible solution that I can think of is to side-step runtime PM
entirely and just call the functions directly. At least on Tegra we
don't rely on the reference counting. I'm not entirely sure that would
work, though, because what we do rely on is interoperability with
generic power domains via runtime PM. The way this was supposed to work
was that the various hardware engines would get powered off and after
the runtime suspend callbacks had successfully executed, the reference
count on their power domains would also be decreased, which would
eventually cause the power domains to be powered off at the right time.
Moving away from runtime suspend callbacks in the drivers would require
at least leaving in a few of the pm_runtime_{get,put}() calls to make
sure the power domains are on/off at the right time.

Thierry

> -Daniel
>=20
> > Thierry
> >
> > Thierry Reding (2):
> >   PM / runtime: Allow drivers to override runtime PM behaviour on sleep
> >   drm/tegra: Allow runtime suspend on system sleep
> >
> >  drivers/base/power/main.c    |  6 ++++--
> >  drivers/base/power/runtime.c | 16 ++++++++++++++++
> >  drivers/gpu/drm/tegra/dc.c   |  1 +
> >  drivers/gpu/drm/tegra/dsi.c  |  1 +
> >  drivers/gpu/drm/tegra/hdmi.c |  1 +
> >  drivers/gpu/drm/tegra/hub.c  |  1 +
> >  drivers/gpu/drm/tegra/sor.c  |  1 +
> >  include/linux/pm.h           |  1 +
> >  include/linux/pm_runtime.h   |  2 ++
> >  9 files changed, 28 insertions(+), 2 deletions(-)
> >
> > --
> > 2.23.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
>=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3f/jAACgkQ3SOs138+
s6FPDhAAhHI9a8QZigTn9tWVonkaI0Vynl6TCa+sP81DogewIJoHb5dTYnvdVQsG
iWY7OLV0YUyF+GGuG6BuNjDPDUGiSe/UKvwqpQhcoIhFTAvFmkxaiWvZ3Jvqx0pW
mrGoV9v+JRipEF8n4qtqWXk1/R69sCbzmY2QXQJy38SpHK8nzH018SrSsbvD9xG5
zG2/liwNTGIBAF7LP0EmxUIrpaw+eLEYqVW5zyVfTruJ3b43KLG9JYaoK571juaT
2qlUKtOq2Zd0mPjlHzmnVM6xQeklxBQWs3/nypa5C+zKKGBYxhPDE3z4BPEHEtiS
Mc0XtIK4eylmyZ/VJZ4q9aCX0if0QMbGQbrf4FFMu9ezW1ffzCdIhMwf0bTgC2FF
uIp6entVZM933EZLsDqs7gDJNCGTpcBzgRbjYLyCPIOP1evrD9dQZXInd0CsnlND
DE7DnsXyOr6J1YoK2iCT30KVvZ3qEGhR/PUjyby48Ij4c36BO2R0vB3OAhl/MgST
5jDS4FgO9TSi6X/IsLKAByMIJtlMzMs8XEvDntMg5oHT7W3Mkg6+QUslBm4LC+xz
mb8lAwigGHDK9pNFYVOgQ99bsHQx6I3aq0rp3+TlAzT/NGUGiwXc10qnfJvL5xYC
wLLb4cft/ZEL5PahFuBwcaxfvbw0FENlD1ugBRUWOo+Uf4DTvWk=
=vD40
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
