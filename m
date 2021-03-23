Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCA6346598
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Mar 2021 17:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbhCWQoa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 23 Mar 2021 12:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233267AbhCWQoO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 12:44:14 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6C0C061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 09:44:13 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id jy13so28168034ejc.2
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JFwiBDI03duxQyQ1RvD0yrgjasm6x8x24UVjjZR+I18=;
        b=IoUkhJi06BNiMCqRZmKha3Lcv+EyMQRtCxonngH0KQovHZPnxR1DnQSWiIFote2kqv
         m/SVLv3udn+yQn6VA9o5bBmNWBDkDm23X5JKltXGjiZOsnBPpkbHK5lPcpV+qvaPBRAD
         lA27s0J0VHWZ5lfmyR3Ym05DHRlXUEfhR3VJRvxHpNJ0MITA1aT0+mjcqMveIEFsegsC
         5C3nH+Ni6O1lOhwH28Dthw9XFStqOWEoiKCleY0JqE/CW28QycMmC2El/eG5fn/5ZUWU
         Vfj2fixwAVORQWmEjz2q+NaaP4HteCk0UA16KsaWDNsbPBZ+UridEI2ZF5ccDCbGddwO
         yy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JFwiBDI03duxQyQ1RvD0yrgjasm6x8x24UVjjZR+I18=;
        b=PdnoCT8Ksm37k3yXgY9gwj1rmFrRvWbXqxtiMmNodbdSdqa0e/oR3wCOx2PwvCqFN8
         IJ/PpJ8HwchOwfG9fMQCio3HRIsQGt8kK4Uiz8Kk0vomL3A9w7ipGdq0XjTGDZXzGWj6
         grQa+licR3R+TOnu8HToyBF3wwYL1pcDpBSIBPlEee2ykAgJsUOcqtVfY6LZcxkuKrFI
         Z65NNfF21tHywjPXa8NRryIS1MPiVF3ViHhBgU4TVxJmv3YFn6kiUBqdMKUwve8hrYku
         g7Nlup6TMs7xNDXS/tx1rdnd/JOfKkEvZ6pLIP1fjO6sIfuXS4t76ISGni+PFHw+Nx4J
         3Zcw==
X-Gm-Message-State: AOAM5322CCOnXXbnkkMAv7v2xLs1mCsI7BeF36JVH2xhC625qecQfIV0
        gJBFvk097egOtHUV6pRd4+v17cHEi7E=
X-Google-Smtp-Source: ABdhPJzqs1v0uk+LMtZymgfRDsaBOvnPlz5o/EIjRG7cSd6s7YGBHF2EkD1c5RZxumrXXABBJVkzag==
X-Received: by 2002:a17:907:76b6:: with SMTP id jw22mr5741411ejc.11.1616517852343;
        Tue, 23 Mar 2021 09:44:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id gj13sm11500185ejb.118.2021.03.23.09.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 09:44:02 -0700 (PDT)
Date:   Tue, 23 Mar 2021 17:44:23 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 15/21] drm/tegra: Add new UAPI to header
Message-ID: <YFoa57HBFpDu119Y@orome.fritz.box>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-16-mperttunen@nvidia.com>
 <a0fdac0d-88cf-6eda-6611-fca951253060@gmail.com>
 <cc746d91-e6b2-53d8-17ff-59cbc8bb522f@kapsi.fi>
 <a51f7552-cec6-efe1-25dd-76422ef7a3e4@gmail.com>
 <d76c465a-7f07-88c4-0dc3-4be3cb212fcf@kapsi.fi>
 <YFnfYsfYaKfSGhon@orome.fritz.box>
 <0cc2ec5c-f8aa-ed45-92b6-32f9eadbdc5a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VncfkK1az1lmuVnP"
Content-Disposition: inline
In-Reply-To: <0cc2ec5c-f8aa-ed45-92b6-32f9eadbdc5a@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--VncfkK1az1lmuVnP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 05:00:30PM +0300, Dmitry Osipenko wrote:
> 23.03.2021 15:30, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Jan 14, 2021 at 12:34:22PM +0200, Mikko Perttunen wrote:
> >> On 1/14/21 10:36 AM, Dmitry Osipenko wrote:
> >>> 13.01.2021 21:56, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> On 1/13/21 8:14 PM, Dmitry Osipenko wrote:
> >>>>> 11.01.2021 16:00, Mikko Perttunen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>> +struct drm_tegra_submit_buf {
> >>>>>> +=C2=A0=C2=A0=C2=A0 /**
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * @mapping_id: [in]
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Identifier of the mapping to use in th=
e submission.
> >>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>>>>> +=C2=A0=C2=A0=C2=A0 __u32 mapping_id;
> >>>>>
> >>>>> I'm now in process of trying out the UAPI using grate drivers and t=
his
> >>>>> becomes the first obstacle.
> >>>>>
> >>>>> Looks like this is not going to work well for older Tegra SoCs, in
> >>>>> particular for T20, which has a small GART.
> >>>>>
> >>>>> Given that the usefulness of the partial mapping feature is very
> >>>>> questionable until it will be proven with a real userspace, we shou=
ld
> >>>>> start with a dynamic mappings that are done at a time of job submis=
sion.
> >>>>>
> >>>>> DRM already should have everything necessary for creating and manag=
ing
> >>>>> caches of mappings, grate kernel driver has been using drm_mm_scan =
for a
> >>>>> long time now for that.
> >>>>>
> >>>>> It should be fine to support the static mapping feature, but it sho=
uld
> >>>>> be done separately with the drm_mm integration, IMO.
> >>>>>
> >>>>> What do think?
> >>>>>
> >>>>
> >>>> Can you elaborate on the requirements to be able to use GART? Are th=
ere
> >>>> any other reasons this would not work on older chips?
> >>>
> >>> We have all DRM devices in a single address space on T30+, hence havi=
ng
> >>> duplicated mappings for each device should be a bit wasteful.
> >>
> >> I guess this should be pretty easy to change to only keep one mapping =
per
> >> GEM object.
> >=20
> > The important point here is the semantics: this IOCTL establishes a
> > mapping for a given GEM object on a given channel. If the underlying
> > implementation is such that the mapping doesn't fit into the GART, then
> > that's an implementation detail that the driver needs to take care of.
> > Similarly, if multiple devices share a single address space, that's
> > something the driver already knows and can take advantage of by simply
> > reusing an existing mapping if one already exists. In both cases the
> > semantics would be correctly implemented and that's really all that
> > matters.
> >=20
> > Overall this interface seems sound from a high-level point of view and
> > allows these mappings to be properly created even for the cases we have
> > where each channel may have a separate address space. It may not be the
> > optimal interface for all use-cases or any one individual case, but the
> > very nature of these interfaces is to abstract away certain differences
> > in order to provide a unified interface to a common programming model.
> > So there will always be certain tradeoffs.
>=20
> For now this IOCTL isn't useful from a userspace perspective of older
> SoCs and I'll need to add a lot of code that won't do anything useful
> just to conform to the specific needs of the newer SoCs. Trying to unify
> everything into a single API doesn't sound like a good idea at this
> point and I already suggested to Mikko to try out variant with a
> separated per-SoC code paths in the next version, then the mappings
> could be handled separately by the T186+ paths.

I'm not sure I understand what you're saying. Obviously the underlying
implementation of this might have to differ depending on SoC generation.
But it sounds like you're suggesting having different UAPIs depending on
SoC generation.

Thierry

--VncfkK1az1lmuVnP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBaGuMACgkQ3SOs138+
s6Fx4xAAmXi0XiBpe9CgWAt00xt6Fx95E6GuvNJcpO7CPMQKCiy5VsCLrgjZQQ3q
WqCbeEewcI4UiDmAitSm0V34uLDLXX44KFod4dAvZog/PkQBTwfmFpAKMzExPWoC
y+ZGkQZ2OmvJjfyUbrkbOl2/GqvqBLOv+EVDVjJ28AtrTMD4FiGubgfSy5wOuNFq
PXVXNQu5yhGUUfcTXX/tEXI5h7Np4VjgON1Q9ICZVb9jADe5BTpYjUBtLrUhxWkL
Z6bCs4VPnwDZeWz5m1XsQX0gFD1ULMZ6DmTeJJQcE4wSl5zkXnd0J+DWP0J0Qnzf
NaXjIZ0BZPp/XOleX+kBDsB9A3TrgVaWb4l2yXb+oaIvecwXnTPkgvSxwfQdwgy7
XPcJX0XgtyVL0TjzSgBadaZO4xNQB6kMCPEVNfVK5tQiYSVaMwJgnlJzQRFdsuJa
J+MgIoMRmC0HXx8QHESRDPDrLyIYgzm4USFBoUcXQ65yiYP0eIpM5AW1kwirQDG/
3jYXiGbNEuxYvBMLMP5Wo0ViqVT0xEUX22ijdnFtBSiZdCZPydPFOFs+q4UmHKOP
RhCUNVt+asblBjF5wu5WlCJZ5/Rq/A+tQsrB+HijGoS37+rPO6Jinii1Rx/IYZyY
pbDCW8+ytBwd+2wnpCAujkzrqF8Ss6bAljqKqxJNwomN1YWAZ2A=
=bEyR
-----END PGP SIGNATURE-----

--VncfkK1az1lmuVnP--
